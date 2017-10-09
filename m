Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EAC03E00CF2; Mon,  9 Oct 2017 14:56:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.47 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.47 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E94B7E00C7B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Oct 2017 14:56:41 -0700 (PDT)
Received: by mail-wm0-f47.google.com with SMTP id k4so169481wmc.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Oct 2017 14:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=97ckHlL+E6n6DzVWwVPNyxgNARmYOmC9qkEdCHPq1d8=;
	b=En7hVGgk3Q66h9kuW1xN1IJ29TPunGwYQqAxEFGo4oj1kj6wbcDdkwENUaEknLbc9M
	H7bKj1Gk5PPAySkbvLViTV9cx7WSKczcmWkLD3dq87UIaw3Wx/CPZT1Jc6MxSufz9oBL
	/vQWyxY2zMfT7IPHG/pYr/2I4MDx/Pb/9xFTnEt2933eKuNOEMCJgiuehWRzZS7wOBXQ
	CEl0rTR9youjDPyuhOb7Q+mVc4jZEdUWftkC9Wqo6lHZmcr5OOZT6BMzyJHRiM0XJvPT
	ZCkw4tSA0d4Ac6gG7J3kYQAhKnwBjxlM/oVEcKRLZkCEV1cEcWnMgEzRTXT7evgsAf/T
	TDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=97ckHlL+E6n6DzVWwVPNyxgNARmYOmC9qkEdCHPq1d8=;
	b=hAs/rIeVY0bb72j1r17ZJlNZgjUFnyiexNmjUlQvWDfioolhfRlCwIAYuy1YkJqf2m
	y2GzScdqm7UvVgLA+yYwfXsus9PWVc3AGMU9AY7EoO6SQkC4xajRF89UdcG0k74m1HZu
	B5xuu3y7iOEYBUhZAWobJOh2a6BEmVXo5sJSqX1MSgZZQwazIm06ik8lTJnKdFfjpnCt
	zyZN+8ef088W5Hkc9i33K+tAbiZD3Ro+TJw6I6S4ikJa8jtJO/dXOhuHPape7oK7uvGk
	URTxgNS6Sy9QN0sMy7xcvPwhBk3F2UHc79I6UAozvNVIFXpyAbh4jfI5UQxjOv6ONBK/
	os+Q==
X-Gm-Message-State: AMCzsaUHkLMW7RTp9y+KNIN3dbEo38eLVfnhjZ86LCAr1AuBHA163aks
	jSAzk9s+XHJGfjf8YxzitcYJC0WAd/CDPiV78Y6lMw==
X-Google-Smtp-Source: AOwi7QCAkQ4+ratX/LoTr3qnbZcu2btjH06p9TlT+NkqVU8idCz3efAXaPEu64d1B6V6mgcQy3igLs771pqPI/v20eg=
X-Received: by 10.223.199.138 with SMTP id l10mr118751wrg.121.1507586200551;
	Mon, 09 Oct 2017 14:56:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.248 with HTTP; Mon, 9 Oct 2017 14:56:40 -0700 (PDT)
In-Reply-To: <20171009195421.17393-1-limon.anibal@gmail.com>
References: <20171009195421.17393-1-limon.anibal@gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Mon, 9 Oct 2017 22:56:40 +0100
Message-ID: <CAPyrkgxJLawo+vREn_HoV9FjLX6s4gz0+2952A75uCmhur+nwg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Cc: meta-virtualization@yoctoproject.org,
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
X-List-Received-Date: Mon, 09 Oct 2017 21:56:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 8:54 PM, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.=
com> wrote:
> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>
> This reverts commit fdee07aadc1b5224a540c7e8893144207e1979cb.
>
> Causes build failures when is cross-compiling to aarch64,
>
> | CGO_ENABLED=3D1 aarch64-linaro-linux-go build -i  -tags " cgo static_bu=
ild" -ldflags "-w -extldflags -static -X main.gitCommit=3D"9d6821d1b53908e2=
49487741eccd567249ca1d99-dirty" -X main.version=3D1.0.0-rc3 " -o runc .
> ...
> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/aa=
rch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nativ=
e/usr/lib/aarch64-linaro-linux/go/pkg/tool/linux_amd64/link: running aarch6=
4-linaro-linux-gcc failed: exit status 1
> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/aa=
rch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nativ=
e/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aarch=
64-linaro-linux/7.1.1/ld: cannot find crt1.o: No such file or directory
> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/aa=
rch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nativ=
e/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aarch=
64-linaro-linux/7.1.1/ld: cannot find crti.o: No such file or directory
> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/aa=
rch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nativ=
e/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aarch=
64-linaro-linux/7.1.1/ld: cannot find crtbeginT.o: No such file or director=
y
> ...
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  recipes-containers/runc/runc.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/r=
unc.inc
> index b1f2ba8..83d5f86 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -21,6 +21,8 @@ EXTRA_OEMAKE=3D"BUILDTAGS=3D''"
>  inherit goarch
>
>  do_compile() {
> +       export GOARCH=3D"${TARGET_GOARCH}"
> +       export GOROOT=3D"${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>         # docker to download its dependencies but rather
>         # use dependencies packaged independently.
> @@ -32,6 +34,7 @@ do_compile() {
>
>         (cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname}=
)
>         export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:$=
{STAGING_DIR_TARGET}/${prefix}/local/go"
> +       export GOROOT=3D"${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_S=
YS}/go"
>
>         # Fix up symlink for go-cross compiler
>         rm -f ${S}/src/import/vendor/src

It seems like we have conflicting changes :( Reverting this patch will
break cross-compilation of runc-opencontainers for x86-64 with musl
libc again.

I'll try cross-compiling both runc variants for arm, aarch64, x86 and
x86-64 and see if I can find a solution that works for everything.

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

