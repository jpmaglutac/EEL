package eel

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class FileUploadService {

    static transactional = true

    def uploadFile(file, msg) throws Exception {
    
				
		//config handler
		def config = ConfigurationHolder.config.fileuploader["lecture"]
		
		//base path to save file
		def path = config.path
		if (!path.endsWith('/'))
			path = path+"/"
		
		/**************************
			check if file exists
		**************************/
		if (file.size == 0) {
			msg = "Could not find file: " + request.locale
			throw new Exception(msg)
		}
		
		/***********************
			check extensions
		************************/
		def fileExtension = file.originalFilename.substring(file.originalFilename.lastIndexOf('.')+1)
		if (!config.allowedExtensions[0].equals("*")) {
			if (!config.allowedExtensions.contains(fileExtension)) {
				msg = "Filetype ${fileExtension} not allowed! Allowed extensions: ${config.allowedExtensions}"
				throw new Exception (msg)
			}
		}
		
		
		/*********************
			check file size
		**********************/
		if (config.maxSize) { //if maxSize config exists
			def maxSizeInKb = ((int) (config.maxSize/1024))
			if (file.size > config.maxSize) { //if filesize is bigger than allowed
				msg = "Uploaded file bigger than allowed. Max file size is ${maxSizeInKb} kb"
				throw new Exception(msg)
			}
		} 
		
		//reaches here if file.size is smaller or equal config.maxSize or if config.maxSize ain't configured (in this case
		//plugin will accept any size of files).
		
		//sets new path
		def currentTime = System.currentTimeMillis()
		path = path+currentTime+"/"
		if (!new File(path).mkdirs())
			log.error "FileUploader plugin couldn't create directories: [${path}]"
		path = path+file.originalFilename
		
		//move file
		log.debug "FileUploader plugin received a ${file.size}b file. Moving to ${path}"
		file.transferTo(new File(path))
		
		//save it on the database
		def ufile = new UFile()
		ufile.name = file.originalFilename
		ufile.size = file.size
		ufile.extension = fileExtension
		ufile.dateUploaded = new Date(currentTime)
		ufile.path = path
		ufile.downloads = 0
		ufile.save(flush: true)
		
		return ufile
    }
}
