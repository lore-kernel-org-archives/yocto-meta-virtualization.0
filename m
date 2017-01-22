Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C330DE00595; Sat, 21 Jan 2017 20:20:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.175 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.175 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4ADF4E0043F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 20:20:27 -0800 (PST)
Received: by mail-qt0-f175.google.com with SMTP id v23so78810007qtb.0
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 20:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Kzo4LmZvqo8oUj27Vk8hKiCKi92u2fRlWtw+Qgu39X0=;
	b=nRPAYam/3O8rbLfNxFdFR5QQzygWVmElNhpm4PfXJra05O7OjynxISyim41Ug0NaNz
	v+Y8YJUvUMBbiuzrmraECXWorNbb4FsbxyW2kPRDbEX7WiqluDSDqViVnPMIzl26InxZ
	tXwZm0Tyl2DdoTO3GrUsgmEeQwAikPtCOJDexu8gp/y6deHy1DgXu6dxN4o4+25e5j6S
	9JFBkcGhM5t0FqWdXOM1CdX9JdAvKxXlhDfz+20xjNXFfSFMprrTkJGIcWdphBCP1ied
	IsowW7Apz7EUpUIsvTOKCTEh/iRifC43oARgOmawfFdyDB845WhUCyxZVpX9wx7KBXXB
	0uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Kzo4LmZvqo8oUj27Vk8hKiCKi92u2fRlWtw+Qgu39X0=;
	b=Ww/xvvxypyYwB2a3VvCPRkxoryIOrcJ12erufna5tpyHCtA0zvLQSWLhuVoJZ8UAZO
	W4mA+ORh4hYBYuZIshlo3x57z3OG8OCGBBz/dwtP76pp9kxdGG5FuL12UMlle1lOS1GR
	rcQF1lBLUt9x4ULcZEvWtUDSy2p+lcIfs3L19S2DH5J4tJH8/WkFfhtvKc4aPTan9+cI
	mFbRmV07hiytjwrLRbjGMnRqkMXOsHVFJU6/2fwJ8hlXk+573cbk62YnfNz5d9LI/I1f
	Q4vonji2ZO73Nco2H9sKGU1h3tnZNDzFX+7pNDIgMZ3qbg6tEumW/wjln9wiSoCb4w26
	RFLA==
X-Gm-Message-State: AIkVDXL/go8NXB9KkeNMSplP26YQQD80q39/40y3hpLcOIiRlReRLCCxQ+G+Zz7A4tNdBrkhpe9DBSoXXaKR+A==
X-Received: by 10.200.43.212 with SMTP id n20mr17931145qtn.117.1485058827301; 
	Sat, 21 Jan 2017 20:20:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Sat, 21 Jan 2017 20:20:26 -0800 (PST)
In-Reply-To: <1484977073-13925-1-git-send-email-jia.zhang@windriver.com>
References: <1484977073-13925-1-git-send-email-jia.zhang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 21 Jan 2017 23:20:26 -0500
Message-ID: <CADkTA4Po_cdvyEFTJgufjJwAurJSp6LOTdDOh50tTnntnk7LfA@mail.gmail.com>
To: Lans Zhang <jia.zhang@windriver.com>
Cc: Raymond Danks <ray.danks@se-eng.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] containered|runc: override GOROOT at build time
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
X-List-Received-Date: Sun, 22 Jan 2017 04:20:29 -0000
Content-Type: multipart/alternative; boundary=001a1135b98edf3c160546a733c9

--001a1135b98edf3c160546a733c9
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Sat, Jan 21, 2017 at 12:37 AM, Lans Zhang <jia.zhang@windriver.com>
wrote:

> Similar to commit 01aa8f1, runc and containered also need to set GOROOT
> explicitly.
>
> Signed-off-by: Lans Zhang <jia.zhang@windriver.com>
> ---
>  recipes-containers/containerd/containerd_git.bb | 1 +
>  recipes-containers/runc/runc_git.bb             | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/recipes-containers/containerd/containerd_git.bb
> b/recipes-containers/containerd/containerd_git.bb
> index ca99e55..096a164 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -44,6 +44,7 @@ do_compile() {
>         mkdir -p .gopath/src/"$(dirname "${CONTAINERD_PKG}")"
>         ln -sf ../../../.. .gopath/src/"${CONTAINERD_PKG}"
>         export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/$
> {prefix}/local/go"
> +       export GOROOT="${STAGING_DIR_NATIVE}/
> ${nonarch_libdir}/${HOST_SYS}/go"
>         cd -
>
>         # Pass the needed cflags/ldflags so that cgo
> diff --git a/recipes-containers/runc/runc_git.bb
> b/recipes-containers/runc/runc_git.bb
> index 905a751..ed9a32e 100644
> --- a/recipes-containers/runc/runc_git.bb
> +++ b/recipes-containers/runc/runc_git.bb
> @@ -43,6 +43,7 @@ do_compile() {
>
>         (cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname})
>         export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/$
> {prefix}/local/go"
> +       export GOROOT="${STAGING_DIR_NATIVE}/
> ${nonarch_libdir}/${HOST_SYS}/go"
>         cd -
>
>         # Pass the needed cflags/ldflags so that cgo
> --
> 2.7.4
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1135b98edf3c160546a733c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Sat, Jan 21, 2017 at 12:37 A=
M, Lans Zhang <span dir=3D"ltr">&lt;<a href=3D"mailto:jia.zhang@windriver.c=
om" target=3D"_blank">jia.zhang@windriver.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Similar to commit 01aa8f1, runc and containered =
also need to set GOROOT<br>
explicitly.<br>
<br>
Signed-off-by: Lans Zhang &lt;<a href=3D"mailto:jia.zhang@windriver.com">ji=
a.zhang@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>containerd_git.bb</a> | 1 +<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc_git.bb" rel=3D"norefer=
rer" target=3D"_blank">runc_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A02 files changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-containers/<wbr>containerd/<a href=3D"http://container=
d_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a> b/reci=
pes-containers/<wbr>containerd/<a href=3D"http://containerd_git.bb" rel=3D"=
noreferrer" target=3D"_blank">containerd_git.bb</a><br>
index ca99e55..096a164 100644<br>
--- a/recipes-containers/<wbr>containerd/<a href=3D"http://containerd_git.b=
b" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
+++ b/recipes-containers/<wbr>containerd/<a href=3D"http://containerd_git.b=
b" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
@@ -44,6 +44,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p .gopath/src/&quot;$(dirname &quot;${CO=
NTAINERD_PKG}&quot;)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ../../../.. .gopath/src/&quot;${CONTAINE=
RD_PKG}<wbr>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/.gopath:${S}/<wbr>ve=
ndor:${STAGING_DIR_TARGET}/$<wbr>{prefix}/local/go&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOROOT=3D&quot;${STAGING_DIR_NATIVE}/<wb=
r>${nonarch_libdir}/${HOST_SYS}/<wbr>go&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
diff --git a/recipes-containers/runc/<a href=3D"http://runc_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc<wbr>_git.bb</a> b/recipes-containers/run=
c/<a href=3D"http://runc_git.bb" rel=3D"noreferrer" target=3D"_blank">runc<=
wbr>_git.bb</a><br>
index 905a751..ed9a32e 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc_git.bb" rel=3D"norefer=
rer" target=3D"_blank">runc<wbr>_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc_git.bb" rel=3D"norefer=
rer" target=3D"_blank">runc<wbr>_git.bb</a><br>
@@ -43,6 +43,7 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd .gopath/src/${dname}; ln -sf ../../../../..=
/${bname} ${bname})<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/.gopath:${S}/<wbr>ve=
ndor:${STAGING_DIR_TARGET}/$<wbr>{prefix}/local/go&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOROOT=3D&quot;${STAGING_DIR_NATIVE}/<wb=
r>${nonarch_libdir}/${HOST_SYS}/<wbr>go&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd -<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a1135b98edf3c160546a733c9--
