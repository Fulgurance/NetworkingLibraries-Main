class Target < ISM::Software

    def configure
        super

        configureSource(arguments:  "--prefix=/usr",
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

        deleteFile("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}/usr/lib/libpcap.a")
    end

end
