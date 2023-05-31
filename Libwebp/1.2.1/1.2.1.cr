class Target < ISM::Software
    
    def configure
        super

        configureSource([   "--prefix=/usr",
                            "--enable-libwebpmux",
                            "--enable-libwebpdemux",
                            "--enable-libwebpdecoder",
                            "--enable-libwebpextras",
                            "--enable-swap-16bit-csp",
                            "--disable-static"],
                            buildDirectoryPath)
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
