class Target < ISM::Software
    
    def configure
        super

        configureSource(arguments: ["--prefix=/usr",
                                    "--sysconfdir=/etc",
                                    "--disable-static",
                                    "--disable-gssapi"],
                        path: buildDirectoryPath)
    end
    
    def build
        super

        makeSource(path: buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource(["DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}","install"],buildDirectoryPath)
    end

end
