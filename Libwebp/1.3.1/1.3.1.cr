class Target < ISM::Software
    
    def configure
        super

        configureSource(arguments:  "--prefix=/usr          \
                                    --enable-libwebpmux     \
                                    --enable-libwebpdemux   \
                                    --enable-libwebpdecoder \
                                    --enable-libwebpextras  \
                                    --enable-swap-16bit-csp \
                                    --disable-static",
                        path:       buildDirectoryPath)
    end

    def build
        super

        makeSource(path: buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource( arguments:  "DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath} install",
                    path:       buildDirectoryPath)
    end

end
