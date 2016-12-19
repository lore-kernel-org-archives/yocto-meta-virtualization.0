Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 550E1E01082; Mon, 19 Dec 2016 06:02:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 155D2E01075
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Dec 2016 06:02:11 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBJE28Su018673
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Dec 2016 06:02:09 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Dec 2016 06:02:07 -0800
To: Fathi Boudra <fathi.boudra@linaro.org>,
	<meta-virtualization@yoctoproject.org>
References: <20161219075858.30738-1-fathi.boudra@linaro.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <cee56134-5baa-c21d-54be-878f2b17f163@windriver.com>
Date: Mon, 19 Dec 2016 09:02:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161219075858.30738-1-fathi.boudra@linaro.org>
Cc: koen.kooi@linaro.org
Subject: Re: [PATCH] docker: update to docker 1.12.5 release
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2016 14:02:16 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-12-19 02:58 AM, Fathi Boudra wrote:
> * update description:
>   - reword docker officially supported hosts section
>   - bump minimal required kernel from 3.8 to 3.10
> * update SRCREV to match docker 1.12.5 tag
> * set GOHOSTOS and GOOS explicitely
> * use a switch to set GOARCH based on TARGET_ARCH value. It also allows to
>   tune arm architecture and set GOARM as appropriate.
> * add zfs graphdriver exclusion to DOCKER_BUILDTAGS

Is the zfs issue something new with 1.12.5 ? Or is it just due to
a different use case ?

I'd like to avoid mixing changes that are not related to the version
bump with the patch that does the bump .. since I've had no ends of
trouble with docker breaking on corner cases. Smaller patches let
me more easily bisect issues.

I was wondering the same thing about the GOHOSTOS/GOOS

> * cosmetic:
>   - align all the DEPENDS
>   - fix indentation in do_install(): space -> tab

We could/should probably split this into the uprev and then the
smaller patches

i.e.

  - version bump
  - doc/description update
  - zfs
  - go build cleanup and arch selection
  - cosmetic

If you don't think you'll have time to get to the split, I can have
a go at it myself .. just let me know so I can make the time to do
the split.

Thanks for the update, I was slowly getting around to doing this
myself so it is nice to get the patch.

Cheers,

Bruce

>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-containers/docker/docker_git.bb | 57 ++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 19 deletions(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 2cff6f1..6d7145e 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -9,16 +9,16 @@ DESCRIPTION = "Linux container runtime \
>   large-scale web deployments, database clusters, continuous deployment \
>   systems, private PaaS, service-oriented architectures, etc. \
>   . \
> - This package contains the daemon and client. Using docker.io on non-amd64 \
> - hosts is not supported at this time. Please be careful when using it \
> - on anything besides amd64. \
> + This package contains the daemon and client. Using docker.io is \
> + officially supported on x86_64 and arm (32-bit) hosts. \
> + Other architectures are considered experimental. \
>   . \
> - Also, note that kernel version 3.8 or above is required for proper \
> + Also, note that kernel version 3.10 or above is required for proper \
>   operation of the daemon process, and that any lower versions may have \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV = "34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b"
> +SRCREV = "7392c3b0ce0f9d3e918a321c66668c5d1ef4f689"
>  SRC_URI = "\
>  	git://github.com/docker/docker.git;nobranch=1 \
>  	file://docker.service \
> @@ -32,10 +32,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "1.12.0"
> +DOCKER_VERSION = "1.12.5"
>  PV = "${DOCKER_VERSION}+git${SRCREV}"
>
> -DEPENDS = "go-cross \
> +DEPENDS = " \
> +    go-cross \
>      go-cli \
>      go-pty \
>      go-context \
> @@ -66,14 +67,32 @@ DOCKER_PKG="github.com/docker/docker"
>  do_configure[noexec] = "1"
>
>  do_compile() {
> -	export GOARCH="${TARGET_ARCH}"
> -	# supported amd64, 386, arm arm64
> -	if [ "${TARGET_ARCH}" = "x86_64" ]; then
> -		export GOARCH="amd64"
> -	fi
> -	if [ "${TARGET_ARCH}" = "aarch64" ]; then
> -		export GOARCH="arm64"
> -	fi
> +	GOHOSTOS="linux"
> +	GOOS="linux"
> +
> +	case "${TARGET_ARCH}" in
> +		arm)
> +			GOARCH=arm
> +			case "${TUNE_PKGARCH}" in
> +				cortexa*)
> +					export GOARM=7
> +				;;
> +			esac
> +		;;
> +		aarch64)
> +			GOARCH=arm64
> +		;;
> +		i586|i686)
> +			GOARCH=386
> +		;;
> +		x86_64)
> +			GOARCH=amd64
> +		;;
> +		*)
> +			GOARCH="${TARGET_ARCH}"
> +		;;
> +	esac
> +	export GOHOSTOS GOOS GOARCH
>
>  	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>  	# docker to download its dependencies but rather
> @@ -92,7 +111,7 @@ do_compile() {
>  	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>  	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>  	# in order to exclude devicemapper and btrfs - https://github.com/docker/docker/issues/14056
> -	export DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdriver_devicemapper'
> +	export DOCKER_BUILDTAGS='exclude_graphdriver_zfs exclude_graphdriver_btrfs exclude_graphdriver_devicemapper'
>
>  	# this is the unsupported built structure
>  	# that doesn't rely on an existing docker
> @@ -121,9 +140,9 @@ do_install() {
>  		install -m 644 ${S}/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
>  		# replaces one copied from above with one that uses the local registry for a mirror
>  		install -m 644 ${WORKDIR}/docker.service ${D}/${systemd_unitdir}/system
> -        else
> -            install -d ${D}${sysconfdir}/init.d
> -            install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
> +	else
> +		install -d ${D}${sysconfdir}/init.d
> +		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
>  	fi
>
>  	mkdir -p ${D}/usr/share/docker/
>


