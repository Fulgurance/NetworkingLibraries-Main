class Target < ISM::Software

    def prepare
        @buildDirectory = true
        super
    end
    
    def configure
        super

        runCmakeCommand(arguments:  "-DCMAKE_INSTALL_PREFIX=/usr                        \
                                    -DCMAKE_BUILD_TYPE=Release                          \
                                    -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/#{versionName}\
                                    -DKDSoap_QT6=ON                                     \
                                    ..",
                        path:       mainWorkDirectoryPath)
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
