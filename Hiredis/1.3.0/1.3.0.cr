class Target < ISM::Software

    def prepare
        @buildDirectory = true
        super
    end
    
    def build
        super

        makeSource( arguments: "PREFIX=/usr",
                    path: buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource( arguments:  "DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath} PREFIX=/usr install",
                    path:       buildDirectoryPath)
    end

end
