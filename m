Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5454E00CD4; Thu, 12 Oct 2017 15:14:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.177 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE37FE00CA2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 15:14:34 -0700 (PDT)
Received: by mail-qt0-f177.google.com with SMTP id v41so6158110qtv.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 15:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6M3d8abv8eUs9V8WpM52Tkp3hHUGdevlI9hDJecrteA=;
	b=XTVoeAyu6UdeoKGpwcjM8HU1XqoO5PcmgFTtNERJ0qxO+kmeEP1Gflq5+2UV7FOqaB
	4LpJOdgTYbXqkhiG7XZdYhPLUDhithYz/Fn+DsnCzCX369dtIgSPqjKKEM7/7wnG3Ktf
	ghsTEfPz9E03fqqgGkZdimGrSQ26K9KmKqfqFefJCXe8+om2oU2fXGYww2/qO9Fp4eRw
	bClnyYaM7O37Gn/LOIIoF4OjMLYuMZz1zy4CzOU/XRxiK22c+ciwNLT3IiYJsFFh9HDY
	Ii9smMd4aO3FvnP5tgi7SjMAT7slsrGeSkO/qiosic5SsfvE05qCC9wPIqEU1lSpCyvM
	IHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6M3d8abv8eUs9V8WpM52Tkp3hHUGdevlI9hDJecrteA=;
	b=lBASJSE4OTptr+/4BzW6mD6uXaJR2mh80AW7gjZJKkXgiUw57a8sVFsCplD8sMD5kz
	H2B/2vRq7Ba/5mjUKUaMVxZp25zRyVKFP18rLjk5RhH7iw5TUbiL7uxO4KxhsrY96GgX
	MRU4/5gEpkpouLKhbwOv+s+4xhTBreO//G8jeGjXvYf1Soq3tBW+oD4f46Zm9t5T9fx4
	BAbsxa3tIsJ01leqLlpw0f2kIqrH+wKY9QCgf7utJIlNXsRRa3eyFfzm3k0r7tEVXSjy
	LnU1n0OdtJ86pMKBjNCBSdByOBCCqGO5J8npsNy6CgJE9HzHqTQqsQgy+8TLtb1zKrrL
	agMg==
X-Gm-Message-State: AMCzsaWe9mtTbwvVgrutsftLFXxnUfipQSmN2oXd3iShAeO8uvSbWXUG
	+WsnsxHt45ShPzXZJtd2pru7U2oyMqDTmvZmue2FDA==
X-Google-Smtp-Source: AOwi7QA2zAa+mQwiNPy6kcHBPFM45XSRMXujCoYLlcuUg+2avMlXS5IhpD0v6izCx+BcqdM8ko6rouHIDH+c5LdlxSA=
X-Received: by 10.200.12.131 with SMTP id n3mr5990740qti.237.1507846473685;
	Thu, 12 Oct 2017 15:14:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Thu, 12 Oct 2017 15:14:33 -0700 (PDT)
In-Reply-To: <CAPyrkgxXdMOVrekC_gFLdRY_1C4dcTnZ==57fkgWOg94Q+PPvg@mail.gmail.com>
References: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
	<1507826997-28383-5-git-send-email-pbarker@toganlabs.com>
	<CADkTA4N07AyeVWHsTBNBde5a6=OvhY4d+PA1B-Lj2unV-HC9Ag@mail.gmail.com>
	<CAPyrkgxXdMOVrekC_gFLdRY_1C4dcTnZ==57fkgWOg94Q+PPvg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Oct 2017 18:14:33 -0400
Message-ID: <CADkTA4Nes_P-_=PMoVD55sXFDJ+-zaXj53gLB2D0i17BPqCJUg@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/4] runc: Simplify recipes
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
X-List-Received-Date: Thu, 12 Oct 2017 22:14:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 12, 2017 at 2:13 PM, Paul Barker <pbarker@toganlabs.com> wrote:
> On 12 Oct 2017 6:02 p.m., "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Oct 12, 2017 at 12:49 PM, Paul Barker <pbarker@toganlabs.com> wrote:
>> * All common settings are merged into the runc.inc file.
>>
>> * SRC_URI and SRCREV settings are normalised, dropping unnecessary
>> arguments.
>
> I'm going to keep the named SRCREVs, since we very often have multiple
> different
> git upstreams in a single build. You'll see that in my new recipes
> that I've been
> adding.
>
> It does no harm, so it stays.
>
>>
>> * Variables in runc.inc are re-ordered slightly to make things clearer.
>
> Extra churn. I'd rather leave things be.
>
>>
>> * Drop unused EXTRA_FLAGS variable in runc-docker which isn't picked up by
>> the
>>   runc Makefile anyway as it isn't exported.
>
> This could be a separate patch.
>
>>
>> * Drop unnecessary do_compile_prepend in runc-opencontainers as the
>> "vendor/src"
>>   symlink is already created in do_compile in runc.inc.
>
> As could this.
>
> Bruce
>
>>
>> Signed-off-by: Paul Barker <pbarker@toganlabs.com>
>> ---
>>  recipes-containers/runc/runc-docker_git.bb         | 10 ++--------
>>  recipes-containers/runc/runc-opencontainers_git.bb | 19
>> ++++---------------
>>  recipes-containers/runc/runc.inc                   |  9 ++++++---
>>  3 files changed, 12 insertions(+), 26 deletions(-)
>>
>> diff --git a/recipes-containers/runc/runc-docker_git.bb
>> b/recipes-containers/runc/runc-docker_git.bb
>> index 28232d9..b1fb624 100644
>> --- a/recipes-containers/runc/runc-docker_git.bb
>> +++ b/recipes-containers/runc/runc-docker_git.bb
>> @@ -2,8 +2,8 @@ include runc.inc
>>
>>  # Note: this rev is before the required protocol field, update when all
>> components
>>  #       have been updated to match.
>> -SRCREV_runc-docker = "9d6821d1b53908e249487741eccd567249ca1d99"
>> -SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
>> +SRCREV = "9d6821d1b53908e249487741eccd567249ca1d99"
>> +SRC_URI = "git://github.com/docker/runc.git \
>>
>> file://0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch \
>>             file://0002-Remove-Platform-as-no-longer-in-OCI-spec.patch \
>>             file://0003-Update-memory-specs-to-use-int64-not-uint64.patch
>> \
>> @@ -12,10 +12,4 @@ SRC_URI =
>> "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
>>             file://0001-Disable-building-recvtty.patch \
>>            "
>>
>> -GO_IMPORT = "import"
>> -
>> -EXTRA_FLAGS = "-v -x -work"
>> -
>>  RUNC_VERSION = "1.0.0-rc3"
>> -PROVIDES += "virtual/runc"
>> -RPROVIDES_${PN} = "virtual/runc"
>> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb
>> b/recipes-containers/runc/runc-opencontainers_git.bb
>> index 2cfceea..ea093ee 100644
>> --- a/recipes-containers/runc/runc-opencontainers_git.bb
>> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
>> @@ -1,19 +1,8 @@
>>  include runc.inc
>>
>>  SRCREV = "2e7cfe036e2c6dc51ccca6eb7fa3ee6b63976dcd"
>> -SRC_URI = " \
>> -    git://github.com/opencontainers/runc;branch=master \
>> -    file://0001-Use-correct-go-cross-compiler.patch \
>> -    "
>> -RUNC_VERSION = "1.0.0-rc4"
>> -PROVIDES += "virtual/runc"
>> -RPROVIDES_${PN} = "virtual/runc"
>> -
>> -GO_IMPORT = "import"
>> +SRC_URI = "git://github.com/opencontainers/runc \
>> +           file://0001-Use-correct-go-cross-compiler.patch \
>> +          "
>>
>> -do_compile_prepend() {
>> -       # Go looks in a src directory under any directory in GOPATH but
>> -       # runc-opencontainers uses 'vendor' instead of 'vendor/src'. We
>> can fix
>> -       # this with a symlink.
>> -       ln -sfn . "${S}/src/import/vendor/src"
>> -}
>> +RUNC_VERSION = "1.0.0-rc4"
>> diff --git a/recipes-containers/runc/runc.inc
>> b/recipes-containers/runc/runc.inc
>> index b1f2ba8..7901bc7 100644
>> --- a/recipes-containers/runc/runc.inc
>> +++ b/recipes-containers/runc/runc.inc
>> @@ -2,6 +2,10 @@ HOMEPAGE = "https://github.com/opencontainers/runc"
>>  SUMMARY = "runc container cli tools"
>>  DESCRIPTION = "runc is a CLI tool for spawning and running containers
>> according to the OCI specification."
>>
>> +PROVIDES += "virtual/runc"
>> +RPROVIDES_${PN} = "virtual/runc"
>> +RRECOMMENDS_${PN} = "lxc docker"
>> +
>>  # Apache-2.0 for containerd
>>  LICENSE = "Apache-2.0"
>>  LIC_FILES_CHKSUM =
>> "file://src/import/LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
>> @@ -11,14 +15,13 @@ S = "${WORKDIR}/git"
>>  PV = "${RUNC_VERSION}+git${SRCREV}"
>>
>>  inherit go
>> -RRECOMMENDS_${PN} = "lxc docker"
>> +GO_IMPORT = "import"
>>
>>  LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
>>
>> -do_configure[noexec] = "1"
>>  EXTRA_OEMAKE="BUILDTAGS=''"
>>
>> -inherit goarch
>> +do_configure[noexec] = "1"
>>
>>  do_compile() {
>>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>> --
>
>
> I'll edit this a bit and resubmit as a couple of smaller commits. Do you
> want to take 1-3 of this series rather than me resending the whole series?

Absolutely. Don't resend 1-3, I'll grab them and merge them shortly.

Bruce



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

