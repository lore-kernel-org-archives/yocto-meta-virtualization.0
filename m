Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 82628E00E5C; Mon, 19 Dec 2016 07:31:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D64BE00E49
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Dec 2016 07:31:00 -0800 (PST)
Received: by mail-wm0-f54.google.com with SMTP id a197so96312086wmd.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Dec 2016 07:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=doktVeMGtikTPW5ft4oSE+m3Ve+iwqwSKNX4A7wJFDs=;
	b=MIiVAM01Dqb2/pvX2k/nuaCMgPObliJ/a/+G2vsLPTzYfq9QpeNRzOBzd0FIyVw3G2
	+g01y0D9YaWkeT9VQmlrFbgPPIsrhyKjrQmT4OwwkRgKETFvhGlbelgGuCdd8J5K4WII
	CM/xZU9CulNVCK3I3dA4ZhHysxyzqatLj/Hng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=doktVeMGtikTPW5ft4oSE+m3Ve+iwqwSKNX4A7wJFDs=;
	b=FEzk3L44hab8HXh9+IZ4fdK8dNYcffgHmyfsqcdZvh+yvhhaf3MjxPvXTbpgkkug0F
	to/ohBd72ckx5OViE9eJG71GJ3lgXwiK13Ro6UC/79/TTN6/zNzE9zqBYICXu5RtEh6A
	25/1+vEVpXIMtCi36CmHJILAy6bF04YqYTqugy26bKV31VUtSEDP24AucItkTR5OLe96
	GDAJm61Ek9lhLuQSMGE6wF/r2nn6egwqhV6tFz1/AlsFSvO3nHrth17tuKihQQ6t1WD/
	dZsxQtOwz6khSkiTs2Zzit4zJtwHR3JARMAbX4Hs9TPZ1I651o1fHw/wVqPsgsLUNP4p
	X/dQ==
X-Gm-Message-State: AIkVDXI3pWTuGuiKxmiFwnYXjV+3HOJhoRjmIvjgan9AjPKq1E2AqDIPxnf0fS2Pj8sIpP47bdHDZTMGRdzfHWKo
X-Received: by 10.28.88.11 with SMTP id m11mr13576775wmb.45.1482161459442;
	Mon, 19 Dec 2016 07:30:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.19.69 with HTTP; Mon, 19 Dec 2016 07:30:58 -0800 (PST)
In-Reply-To: <cee56134-5baa-c21d-54be-878f2b17f163@windriver.com>
References: <20161219075858.30738-1-fathi.boudra@linaro.org>
	<cee56134-5baa-c21d-54be-878f2b17f163@windriver.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Mon, 19 Dec 2016 17:30:58 +0200
Message-ID: <CAGNsrLD+259+Yi5h3e+31BSVUwap8dwu-L3Chui572G4_6ue8Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: meta-virtualization@yoctoproject.org, Koen Kooi <koen.kooi@linaro.org>
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
X-List-Received-Date: Mon, 19 Dec 2016 15:31:03 -0000
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 16:02, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2016-12-19 02:58 AM, Fathi Boudra wrote:
>>
>> * update description:
>>   - reword docker officially supported hosts section
>>   - bump minimal required kernel from 3.8 to 3.10
>> * update SRCREV to match docker 1.12.5 tag
>> * set GOHOSTOS and GOOS explicitely
>> * use a switch to set GOARCH based on TARGET_ARCH value. It also allows to
>>   tune arm architecture and set GOARM as appropriate.
>> * add zfs graphdriver exclusion to DOCKER_BUILDTAGS
>
>
> Is the zfs issue something new with 1.12.5 ? Or is it just due to
> a different use case ?
>
> I'd like to avoid mixing changes that are not related to the version
> bump with the patch that does the bump .. since I've had no ends of
> trouble with docker breaking on corner cases. Smaller patches let
> me more easily bisect issues.
>
> I was wondering the same thing about the GOHOSTOS/GOOS
>
>> * cosmetic:
>>   - align all the DEPENDS
>>   - fix indentation in do_install(): space -> tab
>
>
> We could/should probably split this into the uprev and then the
> smaller patches
>
> i.e.
>
>  - version bump
>  - doc/description update
>  - zfs
>  - go build cleanup and arch selection
>  - cosmetic
>
> If you don't think you'll have time to get to the split, I can have
> a go at it myself .. just let me know so I can make the time to do
> the split.

I have time to split the changes. I'll follow up.

> Thanks for the update, I was slowly getting around to doing this
> myself so it is nice to get the patch.
>
> Cheers,
>
> Bruce
>
>
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>  recipes-containers/docker/docker_git.bb | 57
>> ++++++++++++++++++++++-----------
>>  1 file changed, 38 insertions(+), 19 deletions(-)
>>
>> diff --git a/recipes-containers/docker/docker_git.bb
>> b/recipes-containers/docker/docker_git.bb
>> index 2cff6f1..6d7145e 100644
>> --- a/recipes-containers/docker/docker_git.bb
>> +++ b/recipes-containers/docker/docker_git.bb
>> @@ -9,16 +9,16 @@ DESCRIPTION = "Linux container runtime \
>>   large-scale web deployments, database clusters, continuous deployment \
>>   systems, private PaaS, service-oriented architectures, etc. \
>>   . \
>> - This package contains the daemon and client. Using docker.io on
>> non-amd64 \
>> - hosts is not supported at this time. Please be careful when using it \
>> - on anything besides amd64. \
>> + This package contains the daemon and client. Using docker.io is \
>> + officially supported on x86_64 and arm (32-bit) hosts. \
>> + Other architectures are considered experimental. \
>>   . \
>> - Also, note that kernel version 3.8 or above is required for proper \
>> + Also, note that kernel version 3.10 or above is required for proper \
>>   operation of the daemon process, and that any lower versions may have \
>>   subtle and/or glaring issues. \
>>   "
>>
>> -SRCREV = "34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b"
>> +SRCREV = "7392c3b0ce0f9d3e918a321c66668c5d1ef4f689"
>>  SRC_URI = "\
>>         git://github.com/docker/docker.git;nobranch=1 \
>>         file://docker.service \
>> @@ -32,10 +32,11 @@ LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
>>
>>  S = "${WORKDIR}/git"
>>
>> -DOCKER_VERSION = "1.12.0"
>> +DOCKER_VERSION = "1.12.5"
>>  PV = "${DOCKER_VERSION}+git${SRCREV}"
>>
>> -DEPENDS = "go-cross \
>> +DEPENDS = " \
>> +    go-cross \
>>      go-cli \
>>      go-pty \
>>      go-context \
>> @@ -66,14 +67,32 @@ DOCKER_PKG="github.com/docker/docker"
>>  do_configure[noexec] = "1"
>>
>>  do_compile() {
>> -       export GOARCH="${TARGET_ARCH}"
>> -       # supported amd64, 386, arm arm64
>> -       if [ "${TARGET_ARCH}" = "x86_64" ]; then
>> -               export GOARCH="amd64"
>> -       fi
>> -       if [ "${TARGET_ARCH}" = "aarch64" ]; then
>> -               export GOARCH="arm64"
>> -       fi
>> +       GOHOSTOS="linux"
>> +       GOOS="linux"
>> +
>> +       case "${TARGET_ARCH}" in
>> +               arm)
>> +                       GOARCH=arm
>> +                       case "${TUNE_PKGARCH}" in
>> +                               cortexa*)
>> +                                       export GOARM=7
>> +                               ;;
>> +                       esac
>> +               ;;
>> +               aarch64)
>> +                       GOARCH=arm64
>> +               ;;
>> +               i586|i686)
>> +                       GOARCH=386
>> +               ;;
>> +               x86_64)
>> +                       GOARCH=amd64
>> +               ;;
>> +               *)
>> +                       GOARCH="${TARGET_ARCH}"
>> +               ;;
>> +       esac
>> +       export GOHOSTOS GOOS GOARCH
>>
>>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>>         # docker to download its dependencies but rather
>> @@ -92,7 +111,7 @@ do_compile() {
>>         export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>>         export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>>         # in order to exclude devicemapper and btrfs -
>> https://github.com/docker/docker/issues/14056
>> -       export DOCKER_BUILDTAGS='exclude_graphdriver_btrfs
>> exclude_graphdriver_devicemapper'
>> +       export DOCKER_BUILDTAGS='exclude_graphdriver_zfs
>> exclude_graphdriver_btrfs exclude_graphdriver_devicemapper'
>>
>>         # this is the unsupported built structure
>>         # that doesn't rely on an existing docker
>> @@ -121,9 +140,9 @@ do_install() {
>>                 install -m 644 ${S}/contrib/init/systemd/docker.*
>> ${D}/${systemd_unitdir}/system
>>                 # replaces one copied from above with one that uses the
>> local registry for a mirror
>>                 install -m 644 ${WORKDIR}/docker.service
>> ${D}/${systemd_unitdir}/system
>> -        else
>> -            install -d ${D}${sysconfdir}/init.d
>> -            install -m 0755 ${WORKDIR}/docker.init
>> ${D}${sysconfdir}/init.d/docker.init
>> +       else
>> +               install -d ${D}${sysconfdir}/init.d
>> +               install -m 0755 ${WORKDIR}/docker.init
>> ${D}${sysconfdir}/init.d/docker.init
>>         fi
>>
>>         mkdir -p ${D}/usr/share/docker/
>>
>

