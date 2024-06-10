class Target < ISM::Software

    def prepare
        super

        fileDeleteLine("#{buildDirectoryPath}/libcap/Makefile",190)
        fileDeleteLine("#{buildDirectoryPath}/libcap/Makefile",200)
    end

    def build
        super

        makeSource(["prefix=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}/usr","lib=lib"],path: buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}/usr")

        makeSource(["prefix=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}/usr","lib=lib","install"],buildDirectoryPath)
    end

end
