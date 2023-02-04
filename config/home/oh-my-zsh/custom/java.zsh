# Add ASDF to ZSH
. $(brew --prefix asdf)/libexec/asdf.sh

# Set JAVA_HOME
. ~/.asdf/plugins/java/set-java-home.zsh

# Export JDK environment variable used for build
export JDK8=$(asdf where java liberica-8u342+7)
export JDK11=$(asdf where java liberica-11.0.16+8)
export JDK16=$(asdf where java liberica-16.0.2+7)
export JDK17=$(asdf where java liberica-17.0.4+8)
export JDK18=$(asdf where java liberica-18.0.2+10)