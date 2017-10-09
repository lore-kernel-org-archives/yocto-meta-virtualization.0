Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2724E00D52; Mon,  9 Oct 2017 09:39:12 -0700 (PDT)
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
	*      [209.85.216.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37775E00D2E
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Oct 2017 09:39:11 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id a43so38305866qta.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Oct 2017 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YXQIT5/0p7cYkTQwpUne1Sc7xcUkTDiMxAh009mH4aI=;
	b=tweywbGWMepNGWbfzU840NqieFr/o/H7AfXFJ9mm+jGUNwvmryizQppgidVrQK+yJq
	EqVA9fhj3AlMTem2L5iTmwQqlx4dgCoJrkMZ8RaTzfVOkJsT3kyqRxuNUFu85h3NZUbU
	yrlsv+AcbBpz098fpR3uQ6cq7Rhz4a4r4BQV4ALgZjKqm7lx/0Ehb2PFQoplS0kO0MH7
	1+dsf7VzrHGmYoH2ABjM9l+KhhGvAw2gaPemTtvOjASVdRWtcKB5KQwHlnH9p3ngE3fm
	iyVloF8Br1HXsRJ2bp09mDZ7Y43kZahwnofSDytqAsLw9c0M5fV5hntAZFRJzSRvvyPD
	sBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YXQIT5/0p7cYkTQwpUne1Sc7xcUkTDiMxAh009mH4aI=;
	b=UHAK7SYc0ByyHJLuln96Qdc5+wQabm7toKoViPsOGimqgDAfTfMhWbL75Lmgx75/d3
	aIeSAQsiHj5mLWFSA9ZvICR5bmgfJz4J0Kmx3jgQ3YmvfRFOItgecSu84qmSG/Kz/pV8
	AUdXb5Kl+6OZP4M9/R086isVHIR/rTCRR0h+FNebC9GycYMekob/5N/G5nD97QsjP1Rs
	WgU/p7a/zwqN6Ngk0bwoxw23xMEu1I8z7XAMTCtvskDK+TmTkLpKKrYJG0Og+FPV0cc9
	/ZIMFT7M9KmIWyjmpgx9G4OiqUb+H1yuwTJ09/E3zg0dLI8JRufzEW7YWbdODXoZuvTb
	IaCw==
X-Gm-Message-State: AMCzsaVgMPLloSLHcre4whxVT0u3r9ujfW7GErc7SwgKTTIpjRsNGUe7
	ZsLyBwEGbi2iyZzbVKXhF0VRcwKwQZoZ3KHvMlKv6w==
X-Google-Smtp-Source: AOwi7QBuaaWivhkxogbK7b/UUtKJSstv/34Rn7fE9owdUsSQcSUrS1Mf7QdrNFI6RVqG27LJqZ8eja6arRNWED1t77E=
X-Received: by 10.200.12.131 with SMTP id n3mr15466985qti.237.1507567151262;
	Mon, 09 Oct 2017 09:39:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Mon, 9 Oct 2017 09:39:10 -0700 (PDT)
In-Reply-To: <20171006173248.8373-1-limon.anibal@gmail.com>
References: <20171006173248.8373-1-limon.anibal@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Oct 2017 12:39:10 -0400
Message-ID: <CADkTA4NfqA=0EWwUQFUWEOETg6HwKbdNBBzOqKb6q7NkCBu2SA@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Cc: nicolas.dechesne@linaro.org, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Subject: Re: [PATCH] docker/containerd: Export GOARCH to fix build in arm64
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
X-List-Received-Date: Mon, 09 Oct 2017 16:39:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged.

Bruce

On Fri, Oct 6, 2017 at 1:32 PM, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.=
com> wrote:
> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>
> If the GOARCH isn't set CGO took the ARCH from the host and tries
> to use -m64 flag that isn't available in aarch64 compiler.
>
> ...
> | # github.com/opencontainers/runc/libcontainer/system
> | aarch64-linaro-linux-gcc: error: unrecognized command line option
> '-m64'
> | # github.com/containerd/console
> | aarch64-linaro-linux-gcc: error: unrecognized command line option
> '-m64'
> | Makefile:60: recipe for target 'shim-static' failed
> ...
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  recipes-containers/containerd/containerd.inc | 1 +
>  recipes-containers/docker/docker_git.bb      | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/recipes-containers/containerd/containerd.inc b/recipes-conta=
iners/containerd/containerd.inc
> index 18d9188..e7a3719 100644
> --- a/recipes-containers/containerd/containerd.inc
> +++ b/recipes-containers/containerd/containerd.inc
> @@ -38,6 +38,7 @@ do_compile() {
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> +       export GOARCH=3D"${TARGET_GOARCH}"
>         export CGO_ENABLED=3D"1"
>         export CFLAGS=3D""
>         export LDFLAGS=3D""
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers=
/docker/docker_git.bb
> index 4d6c17c..d2dce76 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -97,6 +97,7 @@ do_compile() {
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> +        export GOARCH=3D${TARGET_GOARCH}
>         export CGO_ENABLED=3D"1"
>         export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
>         export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGET=
}"
> --
> 2.11.0
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

