Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12DC0E01757
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 12:33:56 -0800 (PST)
Received: by mail-lb0-f182.google.com with SMTP id w6so863376lbh.41
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 12:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=MQFfjA/cenk+SmRRq+rujrxfTfyZAKU0uLsuGlBE5IA=;
	b=C84o+b8CTl1iLVYJ6JnZR/sM3j5PWw1Y0F35azcSD/U5OOw+2M6lpC2LnDYzhyUtvS
	7Bxtmm3DRalXlIWUpyi4OZDdEUwdhhFW2peZe/ugLEvRCV2/zFOusfQWqAMN4O8ZzdGc
	FYy3OcM9tWheY7M+gsuTB/yzMGZVP6/5ntzz/rIvwW11669/iQ+dbB6JFHM4oFUuCZaX
	/jBfZVzAjXW/FeVE7by/Y1vzon1+w7MnLeLkeTf0L1yJjsmLO3B+clPzGD2m6wWsc+xS
	5dXLo8SAsUUArG1KaZn33qTPl2TVIrE3b/z3YoZ1jGf7q7jrzGDb9cBIUzQvIiNyv1S1
	F2qw==
MIME-Version: 1.0
X-Received: by 10.152.10.99 with SMTP id h3mr7752021lab.13.1383856435261; Thu,
	07 Nov 2013 12:33:55 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Thu, 7 Nov 2013 12:33:55 -0800 (PST)
In-Reply-To: <1383704237-3496-1-git-send-email-flihp@twobit.us>
References: <1383704237-3496-1-git-send-email-flihp@twobit.us>
Date: Thu, 7 Nov 2013 15:33:55 -0500
Message-ID: <CADkTA4MW4VcA_HuuXq+rq6oa-oF66+r7m68r4kd94MhRvz_ZMg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] xen: use PACKAGECONFIG for SDL and a bit of dependency cleanup
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
X-List-Received-Date: Thu, 07 Nov 2013 20:33:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2013 at 9:17 PM, Philip Tricca <flihp@twobit.us> wrote:
> This patch moves the optional SDL dependency to a PACKAGECONFIG
> entry. It also cleans up dependencies on both the virtual libsdl
> and libsdl. The dependency on libgl is also removed. libGL support
> should be enabled with the 'opengl' distro feature instead. The
> dependency on glib-2.0 is now explicit as well.

Merged. We'll worry about the other issues mentioned in this thread in futu=
re
patches.

Phillip: this should be all your pending patches merged, let me know if I'v=
e
missed anything.

Bruce

>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-extended/xen/xen_4.3.0.bb |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen=
_4.3.0.bb
> index 09c25aa..283da28 100644
> --- a/recipes-extended/xen/xen_4.3.0.bb
> +++ b/recipes-extended/xen/xen_4.3.0.bb
> @@ -21,17 +21,19 @@ COMPATIBLE_HOST =3D '(x86_64.*).*-linux'
>  inherit autotools gettext setuptools update-rc.d
>
>  PACKAGECONFIG ??=3D " \
> +    sdl \
>      xsm \
>  "
> +PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,checkpoli=
cy-native,"
>
> -DEPENDS =3D "util-linux util-linux-native file-native zlib ncurses opens=
sl bison-native flex-native gettext dev86-native iasl-native pciutils virtu=
al/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman python pyt=
hon-setuptools-native xz xz-native libsdl"
> +DEPENDS =3D "util-linux util-linux-native file-native zlib ncurses opens=
sl bison-native flex-native gettext dev86-native iasl-native pciutils bridg=
e-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-n=
ative glib-2.0"
>
>  # inherit setuptools adds python to RDEPENDS, override it
>  RDEPENDS_${PN} =3D ""
>
>  RDEPENDS_${PN}-base =3D "\
> -    libgcc libsdl udev bash perl xz \
> +    libgcc udev bash perl xz \
>      ${PN}-blktap \
>      ${PN}-console \
>      ${PN}-libblktapctl \
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

