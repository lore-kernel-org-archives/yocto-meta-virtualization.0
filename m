Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BBEAE00CF2; Mon,  9 Oct 2017 16:30:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.48 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.48 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 307F5E00C7B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Oct 2017 16:30:34 -0700 (PDT)
Received: by mail-wm0-f48.google.com with SMTP id t69so498032wmt.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Oct 2017 16:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xVIB3Tmf25CvyAIpuocB1I/SySGyfl2xtiTa7lOa2Ss=;
	b=YvmOPDSRHcq3TDzrDy5omeUZh0hBDEwHdmBjkM2VM9kysn1Jg0KzgKNqZ3yWk0Km6G
	1ludwDt5jT6sKiOwk/V1KCoFzKm+D3HCJ1HNOcKeN7mvT/P+eEEGpSIgtL4iHqNF75P1
	V9fIa/YyLZdm/zgOVGunU3+bvSa6n5066G+jvpjunuaWGeYUPJl77tYIDW3EztrMWQUX
	DXbSwsA1c6A8yJBLTaN7HSHh7BVdWlRUrRPgftohXP46YhX7+dsDOwetwwDpH3w51ueH
	I4d6L1QV9TEAwx/HGBe6yI0hKhDuyvq0VCAc32S941yIaumFkecylJ7iokEPyuEmeHzx
	PvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xVIB3Tmf25CvyAIpuocB1I/SySGyfl2xtiTa7lOa2Ss=;
	b=trBUPuYz3XBoKfkPJI0CSLgS96OpzINlEAXiF5DYcBh2v6rMpLgci3ZlKkvxiBEaye
	W0LRcG8nSx4iRacleD+tuMyIgDVuRNxKxUoEbOiL4brgvBpFF5I0nlOWLJgrTtxyt0nO
	BMGwtL1x8e+3P1jm0BF9OU8K6DK+E3GIjRNU0DUFj/Qa3QqA7qeVSef7EN6xT8xbXZic
	0+hUT/evIa5xifMBaObvL5vHGpzeKHEYY5E9GytTmp4PGJbtAUBeh0XOCKphb2BDBb1W
	EbzJWtTea4m+cekO5XBbMRx7iA0ltqEO6FkrwazPjr5NlM2f2uMfpkcoRiSS2P1yNoa0
	Q02A==
X-Gm-Message-State: AMCzsaWrG7ts4IJFjYSqcrM+qvgpEA/9f+ONQmBw1i0+4NslqogeXrmR
	RYCNdPqMoH9jAbPtw9c2VtjbJYDcdC1O/Xl6vinkkA==
X-Google-Smtp-Source: AOwi7QBHq4jW6M1Y/D5Zmkd3mGvPsaLeRMkYTlS5Idy2jePaJUThPzL9yrWgO4OfssD0XOKpIkD4bnXAolXY1T9My70=
X-Received: by 10.28.143.130 with SMTP id r124mr6501135wmd.122.1507591833982; 
	Mon, 09 Oct 2017 16:30:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.248 with HTTP; Mon, 9 Oct 2017 16:30:33 -0700 (PDT)
In-Reply-To: <CADkTA4Mxe=+hQjSmWGCzC97ftaM=52dsMxyevowELySZTaNg4g@mail.gmail.com>
References: <20171009195421.17393-1-limon.anibal@gmail.com>
	<CAPyrkgxJLawo+vREn_HoV9FjLX6s4gz0+2952A75uCmhur+nwg@mail.gmail.com>
	<CADkTA4Mxe=+hQjSmWGCzC97ftaM=52dsMxyevowELySZTaNg4g@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Tue, 10 Oct 2017 00:30:33 +0100
Message-ID: <CAPyrkgzg7bk91F6otNxD7hsup1sp1WMzoED9UNorJa-zEeS_HA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Subject: Re: [PATCH] Revert "runc: Don't override GOARCH or GOROOT"
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
X-List-Received-Date: Mon, 09 Oct 2017 23:30:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 12:02 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, Oct 9, 2017 at 5:56 PM, Paul Barker <pbarker@toganlabs.com> wrote=
:
>> On Mon, Oct 9, 2017 at 8:54 PM, An=C3=ADbal Lim=C3=B3n <limon.anibal@gma=
il.com> wrote:
>>> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>>>
>>> This reverts commit fdee07aadc1b5224a540c7e8893144207e1979cb.
>>>
>>> Causes build failures when is cross-compiling to aarch64,
>>>
>>> | CGO_ENABLED=3D1 aarch64-linaro-linux-go build -i  -tags " cgo static_=
build" -ldflags "-w -extldflags -static -X main.gitCommit=3D"9d6821d1b53908=
e249487741eccd567249ca1d99-dirty" -X main.version=3D1.0.0-rc3 " -o runc .
>>> ...
>>> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/=
aarch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nat=
ive/usr/lib/aarch64-linaro-linux/go/pkg/tool/linux_amd64/link: running aarc=
h64-linaro-linux-gcc failed: exit status 1
>>> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/=
aarch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nat=
ive/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aar=
ch64-linaro-linux/7.1.1/ld: cannot find crt1.o: No such file or directory
>>> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/=
aarch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nat=
ive/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aar=
ch64-linaro-linux/7.1.1/ld: cannot find crti.o: No such file or directory
>>> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/=
aarch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nat=
ive/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aar=
ch64-linaro-linux/7.1.1/ld: cannot find crtbeginT.o: No such file or direct=
ory
>>> ...
>>>
>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>>> ---
>>>  recipes-containers/runc/runc.inc | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc=
/runc.inc
>>> index b1f2ba8..83d5f86 100644
>>> --- a/recipes-containers/runc/runc.inc
>>> +++ b/recipes-containers/runc/runc.inc
>>> @@ -21,6 +21,8 @@ EXTRA_OEMAKE=3D"BUILDTAGS=3D''"
>>>  inherit goarch
>>>
>>>  do_compile() {
>>> +       export GOARCH=3D"${TARGET_GOARCH}"
>>> +       export GOROOT=3D"${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>>>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>>>         # docker to download its dependencies but rather
>>>         # use dependencies packaged independently.
>>> @@ -32,6 +34,7 @@ do_compile() {
>>>
>>>         (cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bnam=
e})
>>>         export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor=
:${STAGING_DIR_TARGET}/${prefix}/local/go"
>>> +       export GOROOT=3D"${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST=
_SYS}/go"
>>>
>>>         # Fix up symlink for go-cross compiler
>>>         rm -f ${S}/src/import/vendor/src
>>
>> It seems like we have conflicting changes :( Reverting this patch will
>> break cross-compilation of runc-opencontainers for x86-64 with musl
>> libc again.
>>
>> I'll try cross-compiling both runc variants for arm, aarch64, x86 and
>> x86-64 and see if I can find a solution that works for everything.
>>
>
> Agreed.
>
> I'll hold off on any revert until I hear from your tests.
>
> For the configs I'm using everything is building with the current set
> of changes.
>
> Bruce
>

I can re-produce the failure by building runc-docker for
raspberrypi3-64. However, runc-opencontainers builds successfully for
raspberrypi3-64. So at worst we can add a do_compile_prepend() in the
recipe for runc-docker (but not the common .inc file). However, the
whole thing looks wrong, GOROOT shouldn't be pointing at the native
sysroot at all. There's probably something strange going on in the
runc-docker makefile.

I'm away for the next couple of days but will then get back to this.

Cheers,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

