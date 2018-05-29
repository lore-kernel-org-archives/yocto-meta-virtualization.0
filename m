Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE3E8E00BAF; Tue, 29 May 2018 07:26:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DAB1E009D4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:26:07 -0700 (PDT)
Received: by mail-wm0-f66.google.com with SMTP id f8-v6so41263790wmc.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yI653uSpsc5ulAXhKa1Dyi1Qpx+bljpCHpoczsye8Yc=;
	b=M9blMogTRpk93+W7cnAN0M2NjGyWCuajMpe3xszkGadFYnUzqKFlqEGEW53cBs6GLf
	fSIjJGzbjEweUqXU3I+qxfFXhhCNnhi6IHjpnV0X4P6yChVzs/QbsL+ImlbPs6MZB6kL
	L8Dit/9hWbniKOpTRrtBmp92eTGsZ0QKm0XNaoinQ1RZg8OZ4/f+GdRc6XT+Jfii2Cqb
	h6tfnaEMGM5dXBW5ZuHoLX3RkGsjKaLTr08HnP44bEtsKJCUaOyrHGucIET6ccPaPbHC
	HaTD/MAksSkv20ZEk7tOmiuGPAEBXpAXHpCbf4VUCropTwS+5Ev0CLhL8sfAJJOQVhv4
	/vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yI653uSpsc5ulAXhKa1Dyi1Qpx+bljpCHpoczsye8Yc=;
	b=Y+FHVObWWALjFmgb1k5YvcVp2fgQsXgVuxLsTiNjb+VM2u2oXnT4p6f9Z1TxHZtjuR
	o7DGCjJiIQKz/h/+TbvhYq+mbyjvGDupAl9FzZcHHdilhOEYuvLoCFHXBNpKiGfbiMKg
	7hV454fX/X33oqCliKVE1ynV74Uni1LOc/PTN3LrAUKYVl2iheDE/caEAsztC5aDAoEh
	OflAj4BTMxyoPIdYeEoqljteJVMohjVRaFd2EJdd9jQC2eyoWyMnsvenmLB3/9SD+Qya
	0TpVNgaIiITqZigKj39LhmohFTUUqZBHqSBtu8nfdzybxsPWUmizwjxXmErKhvjlfmmC
	1+1w==
X-Gm-Message-State: ALKqPwdc8QhSrL423+Kv/NwRnniqMHidbmARrPeNlEpd+xqHGtLI7c5z
	Zk+2GyJNVgD/rtg4V+LUJx8hzR0TNVq1I3XsFYE=
X-Google-Smtp-Source: ADUXVKLOJCaH4A9VvSF2vO2bDi5gUlL7wCIEEfnGOm9IYoKpk9iKKYJKc1lEL9KfUblbUSY7H6AsOp2VKDrAOu3fAFI=
X-Received: by 2002:a2e:c41:: with SMTP id o1-v6mr11380264ljd.87.1527603967072;
	Tue, 29 May 2018 07:26:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:26:06
	-0700 (PDT)
In-Reply-To: <20180525135820.9279-2-pascal.bach@siemens.com>
References: <20180525135820.9279-1-pascal.bach@siemens.com>
	<20180525135820.9279-2-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 May 2018 10:26:06 -0400
Message-ID: <CADkTA4PjzWoXFaVd3L_G_knGNeDGDMVMtk5c6EOXL0z+iW4P3g@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/2] docker: allow enabling seccomp
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
X-List-Received-Date: Tue, 29 May 2018 14:26:09 -0000
Content-Type: multipart/alternative; boundary="000000000000d09f2c056d59030d"

--000000000000d09f2c056d59030d
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, May 25, 2018 at 9:58 AM, Pascal Bach <pascal.bach@siemens.com>
wrote:

> This requires libseccomp from meta-security so it is not enabled by
> default.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-containers/docker/docker_git.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index e055a4f..790170e 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -62,6 +62,9 @@ DEPENDS = " \
>      libtool \
>      "
>
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
> +
>  PACKAGES =+ "${PN}-contrib"
>
>  DEPENDS_append_class-target = " lvm2"
> @@ -105,7 +108,7 @@ do_compile() {
>         export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>         export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>         # in order to exclude devicemapper and btrfs -
> https://github.com/docker/docker/issues/14056
> -       export DOCKER_BUILDTAGS='exclude_graphdriver_btrfs
> exclude_graphdriver_devicemapper'
> +       export DOCKER_BUILDTAGS='exclude_graphdriver_btrfs
> exclude_graphdriver_devicemapper ${PACKAGECONFIG_CONFARGS}'
>
>         export DISABLE_WARN_OUTSIDE_CONTAINER=1
>
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000d09f2c056d59030d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, May 25, 2018 at 9:58 AM=
, Pascal Bach <span dir=3D"ltr">&lt;<a href=3D"mailto:pascal.bach@siemens.c=
om" target=3D"_blank">pascal.bach@siemens.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">This requires libseccomp from meta-security so i=
t is not enabled by default.<br>
<br>
Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">p=
ascal.bach@siemens.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">dock<wbr>er_git.bb</a> | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=
=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a> b/recipes-containe=
rs/docker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">do<wbr>cker_git.bb</a><br>
index e055a4f..790170e 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
@@ -62,6 +62,9 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0libtool \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[seccomp] =3D &quot;seccomp,,libseccomp&quot;<br>
+<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-contrib&quot;<br>
<br>
=C2=A0DEPENDS_append_class-target =3D &quot; lvm2&quot;<br>
@@ -105,7 +108,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=
=3D${STAGING_DIR_<wbr>TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # in order to exclude devicemapper and btrfs - =
<a href=3D"https://github.com/docker/docker/issues/14056" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/docker/<wbr>docker/issues/14056</a><=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_BUILDTAGS=3D&#39;exclude_<wbr>gra=
phdriver_btrfs exclude_graphdriver_<wbr>devicemapper&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_BUILDTAGS=3D&#39;exclude_<wbr>gra=
phdriver_btrfs exclude_graphdriver_<wbr>devicemapper ${PACKAGECONFIG_CONFAR=
GS}&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export DISABLE_WARN_OUTSIDE_<wbr>CONTAINER=3D1<=
br>
<span class=3D"HOEnZb"><font color=3D"#888888">=C2=A0<br>
-- <br>
2.11.0<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--000000000000d09f2c056d59030d--
