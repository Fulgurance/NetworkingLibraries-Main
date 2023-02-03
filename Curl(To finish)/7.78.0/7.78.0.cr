class Target < ISM::Software
    
    def configure
        super
        configureSource([   "--prefix=/usr",
                            "--disable-static",
                            "--with-openssl",
                            "--enable-threaded-resolver",
                            "--with-ca-path=/etc/ssl/certs"],
                            buildDirectoryPath)
    end

    def build
        super
        makeSource([Ism.settings.makeOptions],buildDirectoryPath)
    end
    
    def prepareInstallation
        super
        makeSource([Ism.settings.makeOptions,"DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}","install"],buildDirectoryPath)
    end

end
