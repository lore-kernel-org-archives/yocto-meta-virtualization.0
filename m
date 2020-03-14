Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.10450.1584150939608549523
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Mar 2020 18:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RAW0Ixzp;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id f198so16125185qke.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Mar 2020 18:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=XtM18xqDVd77DqSytF7oVJtS6prr8b52G2ZkCB0hruQ=;
        b=RAW0IxzpbPP5t6ziuFvUxmvr1EJnN73bHcGAPW89iSuhqaDSm9frigG93TgRNIWR6k
         FYg3JnKOu2AsYHgFa7CK+i6/R7N9RPxL4hPlwoFekUQ5cH5sFpGxr6feo4YAyikI3I51
         1v/AvW6zX5w47atwPoudEZHLCUf/5HM9BOPR7FfRYqYRA/X51YAWdmi9pTP3H90gFmsm
         2ExnOpgNPiIJkFxlPvSymTNoRnO17pvfbfYbqll7IzyZqsGL1DjwwHHm1CIHpAsh+PiH
         mK8YrSWbTNuCMH5S01DRkFabRshIq5GvdQQZBFjfJ1kCfrqaZk+QoVqpm4z0+EsTjJNe
         PceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XtM18xqDVd77DqSytF7oVJtS6prr8b52G2ZkCB0hruQ=;
        b=eieIMboFZ70UbtQDlCZZWFCD/lUe2oLcRWj3ZWAc244TWCtR/rzl9gJE9rDmVSwX9S
         yitdEJSgmstsdscBUz8eKv1PD6MXk+QrDP4QStDgWFZGQVsaKt59S++N99t6er+4ccFP
         9Vj9XO/4SdDBQQ1470baQGOQdeRIjmXcigBQZ9zPcQdEl/IyJssIotr0cj1WMHqzIWzH
         1ikNuxt+NSmhhNQT/KO2jb8WYPy1c7qBa9e2VUYSRBkKpWcQQKhndzACVUGGosfsPuDb
         5WxfhXAchDg7F4xDzeZ+th+c4czlB6W4jvLhrTIpNln1B7Sk+K4B3PZ3Q6MXJ9lNv+Sh
         8lOg==
X-Gm-Message-State: ANhLgQ1+rpMeSGl5QfDKiRCpAoku43BwmWgv/Ff1x1ysaWuShLFFGTPd
	sjT/889K4VRLN8ItB0UVey0=
X-Google-Smtp-Source: ADFU+vsKZsmssJqg8D1MBlssGGndbTnr7JTd9cwotMRQBQCxfLbhQhMhhqcfCa9PO83wAeOYpn1vcw==
X-Received: by 2002:a37:aa92:: with SMTP id t140mr14647075qke.119.1584150938516;
        Fri, 13 Mar 2020 18:55:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id m6sm5594405qkh.33.2020.03.13.18.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 18:55:37 -0700 (PDT)
Date: Fri, 13 Mar 2020 21:55:36 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] cri-o: uprev from 1.15 to 1.17
Message-ID: <20200314015535.GD61675@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1583531622-21685-2-git-send-email-mark.asselstine@windriver.com>
 <1583531622-21685-1-git-send-email-mark.asselstine@windriver.com>
 <1583531648-22033-1-git-send-email-mark.asselstine@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] cri-o: uprev from 1.15 to 1.17
on 06/03/2020 Mark Asselstine wrote:

> Uprev to the latest release of cri-o to pick up some fixes and
> CVEs. Makefile updates along with updates to the go.bbclass allow us
> to remove most of the do_compile() tweaks that were in place. To test
> that these removals are sane builds were done for x86_64 and arm64 in
> docker containers with network=none, no issues were found.
> 
> Quite a few runtime tests were done as well since we are stepping up 2
> releases, and we also just uprev'd 'cni' and wanted to validate its
> runtime as well.
> 
> Once the system is started and cri-o is given time to start you can
> use the new 'crio-status info' command to retrieve the runtime status
> of cri-o:
> 
>    root@qemux86-64:~# crio-status info
>    cgroup driver: cgroupfs
>    storage driver:
>    storage root: /var/lib/containers/storage
>    default GID mappings (format <container>:<host>:<size>):
>      0:0:4294967295
>    default UID mappings (format <container>:<host>:<size>):
>      0:0:4294967295
> 
> Additionally 'crictl' was installed (the recipe will be submitted
> shortly) and the cri-o Tutorial found here was run
> (https://github.com/cri-o/cri-o/blob/master/tutorials/crictl.md)
> 
> In order to run the tutorial /etc/cni/net.d/99-loopback.conf and
> /etc/containers/policy.json were taken from
> ./contrib/cni/99-loopback.conf and ./contrib/policy.json in the cri-o
> src repo. The sandbox_config.json and container_redis.json were taken
> from https://github.com/cri-o/cri-o/blob/master/test/testdata (note:
> using core-image-minimal with systemd enabled I had to remove
> "cpu_period": 10000 and "cpu_quota": 20000 to get the tutorial to
> work). We are not able to use the loopback networking to telnet to the
> redis container, but we can use other techniques to validate that it
> is running.
> 
>   root@qemux86-64:~# /usr/lib/go/src/import/_output/crictl --runtime-endpoint unix:///var/run/crio/crio.sock ps
>   CONTAINER           IMAGE                       CREATED             STATE               NAME                ATTEMPT             POD ID
>   72718714360ef       quay.io/crio/redis:alpine   47 seconds ago      Running             podsandbox1-redis   0                   38b97e5a7bb99
>   root@qemux86-64:~# /usr/lib/go/src/import/_output/crictl --runtime-endpoint unix:///var/run/crio/crio.sock exec -i 72718714360ef cat /etc/issue
>   Welcome to Alpine Linux 3.7
>   Kernel \r on an \m (\l)
> 
> The CRIO_BUILD_CROSS approach was no longer valid and was
> dropped. There is most likely some other cleanup we can do but this
> gets us to a good state on the latest release.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb    | 74 ++++++--------------------------
>  recipes-containers/cri-o/files/crio.conf |  7 ++-
>  2 files changed, 17 insertions(+), 64 deletions(-)
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 4fee385..ebf5bab 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -14,9 +14,9 @@ At a high level, we expect the scope of cri-o to be restricted to the following
>   - Resource isolation as required by the CRI \
>   "
>  
> -SRCREV_cri-o = "f61719a88b7de10a88c50e35640f4a7f1f53fbab"
> +SRCREV_cri-o = "6d0ffae63b9b7d8f07e7f9cf50736a67fb31faf3"
>  SRC_URI = "\
> -	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.15;name=cri-o \
> +	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.17;name=cri-o \
>  	file://0001-Makefile-force-symlinks.patch \
>          file://crio.conf \
>  	"
> @@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2
>  
>  GO_IMPORT = "import"
>  
> -PV = "1.15.0+git${SRCREV_cri-o}"
> +PV = "1.17.0+git${SRCREV_cri-o}"
>  
>  DEPENDS = " \
>      glib-2.0 \
> @@ -62,7 +62,7 @@ python __anonymous() {
>  PACKAGES =+ "${PN}-config"
>  
>  RDEPENDS_${PN} += " virtual/containerd virtual/runc"
> -RDEPENDS_${PN} += " e2fsprogs-mke2fs"
> +RDEPENDS_${PN} += " e2fsprogs-mke2fs conmon util-linux iptables conntrack-tools"
>  
>  inherit systemd
>  inherit go
> @@ -70,63 +70,14 @@ inherit goarch
>  inherit pkgconfig
>  
>  EXTRA_OEMAKE="BUILDTAGS=''"
> -CRIO_BUILD_CROSS ?= "1"
>  
>  do_compile() {
>  	set +e
> -	export GOPATH="${S}/src/import:${S}/src/import/vendor"
> -
> -	# link fixups for compilation
> -	rm -f ${S}/src/import/vendor/src
> -	ln -sf ./ ${S}/src/import/vendor/src
> -
> -	mkdir -p ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o
> -	ln -sf ../../../../cmd ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/cmd
> -	ln -sf ../../../../test ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/test
> -	ln -sf ../../../../oci ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/oci
> -	ln -sf ../../../../server ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/server
> -	ln -sf ../../../../pkg ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/pkg
> -	ln -sf ../../../../libpod ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/libpod
> -	ln -sf ../../../../libkpod ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/libkpod
> -	ln -sf ../../../../utils ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/utils
> -	ln -sf ../../../../types ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/types
> -	ln -sf ../../../../version ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/version
> -	ln -sf ../../../../lib ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/lib
> -
> -
> -	rm -f ${S}/src/import/src
> -	ln -sf ./ ${S}/src/import/src
> -	mkdir -p ${S}/src/import/src/github.com/cri-o/cri-o/cmd
> -	ln -sf ../../../../cmd/crio-config ${S}/src/import/src/github.com/cri-o/cri-o/cmd
> -	ln -sf ../../../lib ${S}/src/import/src/github.com/cri-o/cri-o/lib
> -	ln -sf ../../../oci ${S}/src/import/src/github.com/cri-o/cri-o/oci
> -	ln -sf ../../../pkg ${S}/src/import/src/github.com/cri-o/cri-o/pkg
> -	ln -sf ../../../utils ${S}/src/import/src/github.com/cri-o/cri-o/utils
> -	ln -sf ../../../version ${S}/src/import/src/github.com/cri-o/cri-o/version
> -	ln -sf ../../../server ${S}/src/import/src/github.com/cri-o/cri-o/server
> -	ln -sf ../../../types ${S}/src/import/src/github.com/cri-o/cri-o/types
> -
> -	# fixes the bin/crio build of oe_runmake binaries below
> -	ln -sf ../../../../cmd/crio ${S}/src/import/src/github.com/cri-o/cri-o/cmd/
> -
> -	# workaround `use of vendored package not allowed' failure
> -	mv ${S}/src/import/vendor/golang.org  ${S}/src/import/
>  
>  	cd ${S}/src/import
>  
> -	if [ "${CRIO_BUILD_CROSS}" = "1" ]; then
> -	    # New: using the -cross target. But this doesn't build conmon and pause. So
> -	    #      keeping the old parts around if someone yells.
> -	    oe_runmake local-cross
> -	else
> -	    # Build conmon/config.h, requires native versions of
> -	    # cmd/crio-config/config.go and oci/oci.go
> -	    (CGO_ENABLED=0 GO=go GOARCH=${BUILD_GOARCH} GOOS=${BUILD_GOOS} oe_runmake conmon/config.h)
> -	    rm -f bin/crio-config
> -	    rm -rf vendor/pkg
> -
> -	    oe_runmake binaries
> -	fi
> +	oe_runmake local-cross
> +	oe_runmake binaries
>  }
>  
>  SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> @@ -141,6 +92,7 @@ do_install() {
>      install -d ${D}/${libexecdir}/crio
>      install -d ${D}/${sysconfdir}/crio
>      install -d ${D}${systemd_unitdir}/system/
> +    install -d ${D}/usr/share/containers/oci/hooks.d
>  
>      install ${WORKDIR}/crio.conf ${D}/${sysconfdir}/crio/crio.conf
>  
> @@ -149,19 +101,21 @@ do_install() {
>      install -m 755 -D ${S}/src/import/test/testdata/* ${D}/${sysconfdir}/crio/config/
>  
>      install ${S}/src/import/bin/crio.cross.linux* ${D}/${localbindir}/crio
> -
> -    if [ "${CRIO_BUILD_CROSS}" = "1" ]; then
> -	install ${S}/src/import/bin/conmon ${D}/${localbindir}/crio
> -	install ${S}/src/import/bin/pause ${D}/${localbindir}/crio
> -    fi
> +    install ${S}/src/import/bin/crio-status ${D}/${localbindir}/
> +    install ${S}/src/import/bin/pinns ${D}/${localbindir}/
>  
>      install -m 0644 ${S}/src/import/contrib/systemd/crio.service  ${D}${systemd_unitdir}/system/
>      install -m 0644 ${S}/src/import/contrib/systemd/crio-shutdown.service  ${D}${systemd_unitdir}/system/
> +    install -m 0644 ${S}/src/import/contrib/systemd/crio-wipe.service  ${D}${systemd_unitdir}/system/
>  }
>  
>  FILES_${PN}-config = "${sysconfdir}/crio/config/*"
>  FILES_${PN} += "${systemd_unitdir}/system/*"
>  FILES_${PN} += "/usr/local/bin/*"
> +FILES_${PN} += "/usr/share/containers/oci/hooks.d"
> +
> +# don't clobber hooks.d
> +ALLOW_EMPTY_${PN} = "1"
>  
>  INSANE_SKIP_${PN} += "ldflags already-stripped"
>  
> diff --git a/recipes-containers/cri-o/files/crio.conf b/recipes-containers/cri-o/files/crio.conf
> index 9135df0..899d255 100644
> --- a/recipes-containers/cri-o/files/crio.conf
> +++ b/recipes-containers/cri-o/files/crio.conf
> @@ -24,7 +24,7 @@ storage_option = [
>  [crio.api]
>  
>  # listen is the path to the AF_LOCAL socket on which crio will listen.
> -listen = "/var/run/crio.sock"
> +listen = "/var/run/crio/crio.sock"
>  
>  # stream_address is the IP address on which the stream server will listen
>  stream_address = ""
> @@ -69,7 +69,7 @@ runtime_untrusted_workload = ""
>  default_workload_trust = "trusted"
>  
>  # conmon is the path to conmon binary, used for managing the runtime.
> -conmon = "/usr/libexec/crio/conmon"
> +conmon = "/usr/bin/conmon"
>  
>  # conmon_env is the environment variable list for conmon process,
>  # used for passing necessary environment variable to conmon or runtime.
> @@ -132,8 +132,7 @@ insecure_registries = [
>  
>  # registries is used to specify a comma separated list of registries to be used
>  # when pulling an unqualified image (e.g. fedora:rawhide).
> -registries = [
> -]
> +registries = ['docker.io', 'registry.fedoraproject.org', 'registry.access.redhat.com']
>  
>  # The "crio.network" table contains settings pertaining to the
>  # management of CNI plugins.
> -- 
> 2.7.4
> 

In message: [meta-virtualization][PATCH 1/2] cni: 1.7.0 to 1.7.1 (and plugins 0.8.2 to 0.8.5)
on 06/03/2020 Mark Asselstine wrote:

> Both uprev's are listed as 'minor' in the upstream release
> notes. Neither introduces an uprev in spec. This fixes issues we
> observed while testing the forthcoming cri-o uprev.
> 
> NOTE: this commit should only be used with the follow-on commit [cni:
> prevent go from downloading stuff in the background] otherwise you
> will end up with files not owned by you which will prevent the recipe
> being properly cleaned.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-networking/cni/cni_git.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
> index b8adf88..a81e6cc 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -9,8 +9,9 @@ Because of this focus, CNI has a wide range of support and the specification \
>  is simple to implement. \
>  "
>  
> -SRCREV_cni = "dc71cd2ba60c452c56a0a259f2a23d2afe42b688"
> -SRCREV_plugins = "0eddc554c0747200b7b112ce5322dcfa525298cf"
> +SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
> +# Version 0.8.5
> +SRCREV_plugins = "1f33fb729ae2b8900785f896df2dc1f6fe5e8239"
>  SRC_URI = "\
>  	git://github.com/containernetworking/cni.git;nobranch=1;name=cni \
>          git://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins \
> @@ -23,7 +24,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464
>  
>  GO_IMPORT = "import"
>  
> -PV = "0.7.0+git${SRCREV_cni}"
> +PV = "0.7.1+git${SRCREV_cni}"
>  
>  inherit go
>  inherit goarch
> -- 
> 2.7.4
> 

In message: [meta-virtualization][PATCH 2/2] cni: prevent go from downloading stuff in the background
on 06/03/2020 Mark Asselstine wrote:

> While testing the cni uprev by building in a container with
> network=none the following error was found:
> 
>   go: github.com/Microsoft/go-winio@v0.4.11: Get
>    https://proxy.golang.org/github.com/%21microsoft/go-winio/@v/v0.4.11.mod:
>    dial tcp: lookup proxy.golang.org on 128.224.144.130:53:
>    dial udp 128.224.144.130:53: connect: network is unreachable
> 
> After some digging through the go documentation it was found that the
> '-mod=vendor' is required for 'go build' to use shipped vendor modules
> when building modules. This can be confirmed by look at the
> 'build_linux.sh' script which is found in the plugins repo.
> 
> By using '-mod=vendor' and also ensuring things are properly placed in
> the GOPATH (ie $B) we can avoid having to create many of the links we
> had been previously.
> 
> We also put all the build artifacts into $B to avoid mixing source and
> build.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-networking/cni/cni_git.bb | 32 +++++++++-----------------------
>  1 file changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
> index a81e6cc..3ad939b 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -14,7 +14,7 @@ SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
>  SRCREV_plugins = "1f33fb729ae2b8900785f896df2dc1f6fe5e8239"
>  SRC_URI = "\
>  	git://github.com/containernetworking/cni.git;nobranch=1;name=cni \
> -        git://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins \
> +        git://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=${S}/src/github.com/containernetworking/plugins;name=plugins \
>  	"
>  
>  RPROVIDES_${PN} += "kubernetes-cni"
> @@ -30,36 +30,22 @@ inherit go
>  inherit goarch
>  
>  do_compile() {
> -	# link fixups for compilation
> -	rm -f ${S}/src/import/vendor/src
> -	mkdir -p ${S}/src/import/vendor/
> -	ln -sf ./ ${S}/src/import/vendor/src
> -	rm -rf ${S}/src/import/plugins
> -	rm -rf ${S}/src/import/vendor/github.com/containernetworking/plugins
> +	mkdir -p ${S}/src/github.com/containernetworking
> +	ln -sfr ${S}/src/import ${S}/src/github.com/containernetworking/cni
>  
> -	mkdir -p ${S}/src/import/vendor/github.com/containernetworking/cni
> -
> -	ln -sf ../../../../libcni ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
> -	ln -sf ../../../../pkg ${S}/src/import/vendor/github.com/containernetworking/cni/pkg
> -	ln -sf ../../../../cnitool ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
> -	ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/containernetworking/plugins
> -
> -	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> -	export CGO_ENABLED="1"
> -
> -	cd ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
> +	cd ${B}/src/github.com/containernetworking/cni/libcni
>  	${GO} build
>  
> -	cd ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
> +	cd ${B}/src/github.com/containernetworking/cni/cnitool
>  	${GO} build
>  
> -	cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
> +	cd ${B}/src/github.com/containernetworking/plugins
>  	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d plugins/main/* | grep -v windows)"
> -	mkdir -p ${WORKDIR}/plugins/bin/
> +	mkdir -p ${B}/plugins/bin/
>  	for p in $PLUGINS; do
>  	    plugin="$(basename "$p")"
>  	    echo "building: $p"
> -	    ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
> +	    ${GO} build -mod=vendor -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
>  	done
>  }
>  
> @@ -70,7 +56,7 @@ do_install() {
>      install -d ${D}/${sysconfdir}/cni/net.d
>  
>      install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
> -    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
> +    install -m 755 -D ${B}/plugins/bin/* ${D}/${localbindir}
>  
>      # Parts of k8s expect the cni binaries to be available in /opt/cni
>      install -d ${D}/opt/cni
> -- 
> 2.7.4
> 

