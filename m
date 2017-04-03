Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 552ECE00AE0; Mon,  3 Apr 2017 04:15:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA198E00A4C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Apr 2017 04:15:43 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id n37so18357956qtb.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Apr 2017 04:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k9kNRcL/ud2eKC4mPXO0ILonPZe2TLF0nLOuTHP00d4=;
	b=fUtpuXgb+mI1+7UXEjsI1UHNay9bl5WPxuDhxRJlfv5fAzVvOPXUH/QF9zBOOV1hh/
	p/PyLn4ea5kL3pmHNnlgryUeOMYJYzDADUobTZz7aHt5AfoWWdQLiKm2hUtdgpNyWb2g
	TAabgVkOGPjvOaLTevGDJ/tCezrVcxhrBxUFEnWELKYrpltvs7n5izzEV19LMpQlZsWo
	MI7Kl/XrBTD2yFa9IA93zwXQgw+lZ5p/U+Qhi0hwCgEXCXPt3Cv5FeEgD1fpmzVdkdmD
	vcCPzVu0u+bxtMDMUrJAGtD4aqRRYaSGpYilKLzoGF/XB+pdcbwTV+YtVz7vuLRqNeJ0
	egDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k9kNRcL/ud2eKC4mPXO0ILonPZe2TLF0nLOuTHP00d4=;
	b=CCYBNLNKgnKTQ9fUv+jb77i+GKmBxbS7nvQcmOEvLpI0nDgeTK3czSe/Uk9fQ07dY7
	CJk6gL1fzMXF6chGiAqTamtyfJ24rRVdTq72N93VdHgdsU/5VqcYlwWyzXp21PirldRS
	d7EWqP/cYKH50ksHQF9G4xzb9mNLcM85mZV129FM2g3jlFvSRpPfS5rdayTcIio12lNK
	qaxZWxyz7v4R1b/N2yxYynJzWi/3uRre5RCqOA70o9svoizOg9SM6ND5MskPkDfLEbUD
	PS1T1YPhVLvm5ItvXyIzHIvsgj0hihhl9Ha5V9W2MbPy6Qy5chvbnSWKVlJYipLOLPuf
	gTVQ==
X-Gm-Message-State: AFeK/H0DAwWZBkRcWl3mYZUIQuurfyDZ5GzY/gOCY3zBd+WNvsqDr+z0J6FABQe/pb7Jh3eT+vmtrW/xVudtew==
X-Received: by 10.200.35.195 with SMTP id r3mr16559706qtr.282.1491218142657;
	Mon, 03 Apr 2017 04:15:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Mon, 3 Apr 2017 04:15:42 -0700 (PDT)
In-Reply-To: <1491204611-40395-1-git-send-email-adrian.calianu@enea.com>
References: <1491204611-40395-1-git-send-email-adrian.calianu@enea.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Apr 2017 07:15:42 -0400
Message-ID: <CADkTA4NZ+VkDr+pRd8q97ovUrfn7ZdhKqU8ZBSA8UrVpp_pvPQ@mail.gmail.com>
To: Adrian Calianu <adrian.calianu@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCHv1 1/1] docker: fix dependency issues with deb packaging
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
X-List-Received-Date: Mon, 03 Apr 2017 11:15:46 -0000
Content-Type: multipart/alternative; boundary=001a1142c176ad002b054c41476d

--001a1142c176ad002b054c41476d
Content-Type: text/plain; charset=UTF-8

IMHO the deb backend (or a class to translate things) needs to happen here.

With this change, I can no longer do a preferred provider and have the
exclusion
of the opencontainer and docker variants.

So unless the above functionality can be provided, I don't see how I can
merge
this change.

Also, how is the deb backend dealing with virtual/kernel, virtual/libc, etc
?

Bruce

On Mon, Apr 3, 2017 at 3:30 AM, Adrian Calianu <adrian.calianu@enea.com>
wrote:

> dpkg-deb does not accept RDEPENDS += "virtual/xxxx"
>
> 'Provides' field, invalid package name 'virtual/containerd': character
> '/' not allowed (only letters, digits and characters '-+._')
>
> Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
> ---
>  recipes-containers/containerd/containerd-docker_git.bb | 1 -
>  recipes-containers/docker/docker_git.bb                | 2 +-
>  recipeSs-containers/runc/runc-docker_git.bb             | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd-docker_git.bb
> b/recipes-containers/containerd/containerd-docker_git.bb
> index f6dcaec..604ada3 100644
> --- a/recipes-containers/containerd/containerd-docker_git.bb
> +++ b/recipes-containers/containerd/containerd-docker_git.bb
> @@ -7,4 +7,3 @@ SRC_URI = "\
>  CONTAINERD_VERSION = "0.2.3"
>
>  PROVIDES += "virtual/containerd"
> -RPROVIDES_${PN} = "virtual/containerd"
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index 6b73cf3..16d1dad 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -64,7 +64,7 @@ DEPENDS_append_class-target = " lvm2"
>  RDEPENDS_${PN} = "curl aufs-util git util-linux iptables \
>                    ${@bb.utils.contains('DISTRO_FEATURES','systemd','','cgroup-lite',d)}
> \
>                   "
> -RDEPENDS_${PN} += "virtual/containerd virtual/runc"
> +RDEPENDS_${PN} += "containerd-docker runc-docker"
>
>  RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
>  RSUGGESTS_${PN} = "lxc rt-tests"
> diff --git a/recipes-containers/runc/runc-docker_git.bb
> b/recipes-containers/runc/runc-docker_git.bb
> index 96d48ca..bf32953 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -8,4 +8,3 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1 \
>
>  RUNC_VERSION = "1.0.0-rc2"
>  PROVIDES += "virtual/runc"
> -RPROVIDES_${PN} = "virtual/runc"
> --
> 1.9.1
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1142c176ad002b054c41476d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">IMHO the deb backend (or a class to translate things) need=
s to happen here.<div><br></div><div>With this change, I can no longer do a=
 preferred provider and have the exclusion</div><div>of the opencontainer a=
nd docker variants.</div><div><br></div><div>So unless the above functional=
ity can be provided, I don&#39;t see how I can merge</div><div>this change.=
</div><div><br></div><div>Also, how is the deb backend dealing with virtual=
/kernel, virtual/libc, etc ?</div><div><br></div><div>Bruce</div><div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Apr 3, 2017 at=
 3:30 AM, Adrian Calianu <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.cal=
ianu@enea.com" target=3D"_blank">adrian.calianu@enea.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">dpkg-deb does not accept RDEPENDS +=
=3D &quot;virtual/xxxx&quot;<br>
<br>
&#39;Provides&#39; field, invalid package name &#39;virtual/containerd&#39;=
: character<br>
&#39;/&#39; not allowed (only letters, digits and characters &#39;-+._&#39;=
)<br>
<br>
Signed-off-by: Adrian Calianu &lt;<a href=3D"mailto:adrian.calianu@enea.com=
">adrian.calianu@enea.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/containerd/<a href=3D"http://containerd-docker_git=
.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>containerd-docker_git.bb</a>=
 | 1 -<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">dock<wbr>er_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0recipeSs-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D=
"noreferrer" target=3D"_blank">runc-<wbr>docker_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A03 files changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-containers/<wbr>containerd/<a href=3D"http://container=
d-docker_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd-docker_<wb=
r>git.bb</a> b/recipes-containers/<wbr>containerd/<a href=3D"http://contain=
erd-docker_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd-docker_<=
wbr>git.bb</a><br>
index f6dcaec..604ada3 100644<br>
--- a/recipes-containers/<wbr>containerd/<a href=3D"http://containerd-docke=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd-docker_<wbr>git.b=
b</a><br>
+++ b/recipes-containers/<wbr>containerd/<a href=3D"http://containerd-docke=
r_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd-docker_<wbr>git.b=
b</a><br>
@@ -7,4 +7,3 @@ SRC_URI =3D &quot;\<br>
=C2=A0CONTAINERD_VERSION =3D &quot;0.2.3&quot;<br>
<br>
=C2=A0PROVIDES +=3D &quot;virtual/containerd&quot;<br>
-RPROVIDES_${PN} =3D &quot;virtual/containerd&quot;<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=
=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a> b/recipes-containe=
rs/docker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">do<wbr>cker_git.bb</a><br>
index 6b73cf3..16d1dad 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
@@ -64,7 +64,7 @@ DEPENDS_append_class-target =3D &quot; lvm2&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;curl aufs-util git util-linux iptables \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.=
utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;,&#39;systemd&#39;,&#39;&#39;,=
&#39;<wbr>cgroup-lite&#39;,d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-RDEPENDS_${PN} +=3D &quot;virtual/containerd virtual/runc&quot;<br>
+RDEPENDS_${PN} +=3D &quot;containerd-docker runc-docker&quot;<br>
<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;kernel-module-dm-thin-pool kernel-module-=
nf-nat&quot;<br>
=C2=A0RSUGGESTS_${PN} =3D &quot;lxc rt-tests&quot;<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" =
rel=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a> b/recipes-=
containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">runc<wbr>-docker_git.bb</a><br>
index 96d48ca..bf32953 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
@@ -8,4 +8,3 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker=
/runc.git;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/doc=
ker/runc.<wbr>git;nobranch=3D1</a> \<br>
<br>
=C2=A0RUNC_VERSION =3D &quot;1.0.0-rc2&quot;<br>
=C2=A0PROVIDES +=3D &quot;virtual/runc&quot;<br>
-RPROVIDES_${PN} =3D &quot;virtual/runc&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div></div>

--001a1142c176ad002b054c41476d--
