Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CEEB6E00B53; Thu, 29 Jun 2017 12:42:51 -0700 (PDT)
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
	*      [209.85.215.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.45 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E380E00B1B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 12:42:38 -0700 (PDT)
Received: by mail-lf0-f45.google.com with SMTP id b207so58713271lfg.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 12:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yoP5lLoWyBU+HLIYGFGCzUSda0nTErnzeT3V3r5RkKQ=;
	b=hpPzYBEbYf3MlHEM/HOFPzizcQo9XwayQZdOeV7viZmw81zwvp0T94ngOwIuzR+znI
	as/jOl2BIgshhvZLpl1A+ofohC0XnlwSN4XLLJVF3xcnZrpVisrOHPJ4u42S8UrJ6265
	eveDSoaq4vjlAq06zjeRbWbio+8qSA3kQ7YI3daRY9EXs+fuOmtrbiC+sfGOIM5SYbCA
	dbeetxfF26WO+I+RwRHAmTU0RWD1dXWMRjNmD08cHEag6etiPsf7l6ldm7qcakegPJhf
	qTdEfCLaySyAeO1ABEIe/KXPkEn7fjb5Xu0n4vfUAXkR7fllbuBuRX1xTbMmQu+bUEDL
	Clig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yoP5lLoWyBU+HLIYGFGCzUSda0nTErnzeT3V3r5RkKQ=;
	b=hoAFH0uB1zvPpWvH9VyRIon+lSVS7Ol3jl7I3DFXzEaLuBXwwDXHJbWiMLYgviz1V2
	sJXJ1zzo5bJQyAX0GwFU42RGgyNMP8XzgatN6lECRU5NExzxcbKUmHW9LrceW/konwJf
	sYk34ag2VHQ+tgi5k+9J+GUp8eOyVHHzE9TAqadMqdpRsNhXqnE/A4KkyEOzpO5qGwWk
	71FKwMExmvnSoUz9gk8sH5Vg4qnf/U618zhg+f2/13PWTuXzcAQQfcdiUTzeRVeAC/Y/
	PdDyGoVu97iYLV/vPNR86EKEkN/f9vmmC9hDBCoa0MRm+s7lkIwvx8aoLfKLn+XYum+m
	O42Q==
X-Gm-Message-State: AIVw112qTDTZfDwfEnN+Xfjok/DGp440VnpNiQpfoQUis5h0Drfbm13l
	IXSdlbxL/qvGAp2wFy9W0Dj0o1FVow==
X-Received: by 10.46.84.93 with SMTP id y29mr112322ljd.116.1498765357124; Thu,
	29 Jun 2017 12:42:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Thu, 29 Jun 2017 12:42:36 -0700 (PDT)
In-Reply-To: <1498639968-17391-2-git-send-email-zhe.he@windriver.com>
References: <1498639968-17391-1-git-send-email-zhe.he@windriver.com>
	<1498639968-17391-2-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Jun 2017 15:42:36 -0400
Message-ID: <CADkTA4MpTqveVSkSc2EDkouGfF-6awQe1zxsfdPrO3LEDECE8A@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] glusterfs: Move from meta-openstack to meta-cloud-services
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
X-List-Received-Date: Thu, 29 Jun 2017 19:42:51 -0000
Content-Type: multipart/alternative; boundary="f403045fba4eb68fbd05531e80f6"

--f403045fba4eb68fbd05531e80f6
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Jun 28, 2017 at 4:52 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> It's not an openstack specific package.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  .../files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch
> | 0
>  .../recipes-extended => recipes-extended}/glusterfs/files/glusterd-ovp
>   | 0
>  .../glusterfs/files/glusterfs-disable-default-startup-scripts.patch
>  | 0
>  .../glusterfs/files/xlator-host-contamination-3.4.patch
>  | 0
>  .../recipes-extended => recipes-extended}/glusterfs/glusterfs.inc
>  | 0
>  .../recipes-extended => recipes-extended}/glusterfs/glusterfs_3.4.2.bb
>   | 0
>  6 files changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/
> files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch
> (100%)
>  rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/files/glusterd-ovp
> (100%)
>  rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/
> files/glusterfs-disable-default-startup-scripts.patch (100%)
>  rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/
> files/xlator-host-contamination-3.4.patch (100%)
>  rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/glusterfs.inc
> (100%)
>  rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/gl
> usterfs_3.4.2.bb (100%)
>
> diff --git a/meta-openstack/recipes-extended/glusterfs/files/0001-
> Fix-for-mount.glusterfs-not-accepting-version-argume.patch
> b/recipes-extended/glusterfs/files/0001-Fix-for-mount.
> glusterfs-not-accepting-version-argume.patch
> similarity index 100%
> rename from meta-openstack/recipes-extended/glusterfs/files/0001-
> Fix-for-mount.glusterfs-not-accepting-version-argume.patch
> rename to recipes-extended/glusterfs/files/0001-Fix-for-mount.
> glusterfs-not-accepting-version-argume.patch
> diff --git a/meta-openstack/recipes-extended/glusterfs/files/glusterd-ovp
> b/recipes-extended/glusterfs/files/glusterd-ovp
> similarity index 100%
> rename from meta-openstack/recipes-extended/glusterfs/files/glusterd-ovp
> rename to recipes-extended/glusterfs/files/glusterd-ovp
> diff --git a/meta-openstack/recipes-extended/glusterfs/files/
> glusterfs-disable-default-startup-scripts.patch
> b/recipes-extended/glusterfs/files/glusterfs-disable-
> default-startup-scripts.patch
> similarity index 100%
> rename from meta-openstack/recipes-extended/glusterfs/files/
> glusterfs-disable-default-startup-scripts.patch
> rename to recipes-extended/glusterfs/files/glusterfs-disable-
> default-startup-scripts.patch
> diff --git a/meta-openstack/recipes-extended/glusterfs/files/
> xlator-host-contamination-3.4.patch b/recipes-extended/glusterfs/
> files/xlator-host-contamination-3.4.patch
> similarity index 100%
> rename from meta-openstack/recipes-extended/glusterfs/files/
> xlator-host-contamination-3.4.patch
> rename to recipes-extended/glusterfs/files/xlator-host-
> contamination-3.4.patch
> diff --git a/meta-openstack/recipes-extended/glusterfs/glusterfs.inc
> b/recipes-extended/glusterfs/glusterfs.inc
> similarity index 100%
> rename from meta-openstack/recipes-extended/glusterfs/glusterfs.inc
> rename to recipes-extended/glusterfs/glusterfs.inc
> diff --git a/meta-openstack/recipes-extended/glusterfs/glusterfs_3.4.2.bb
> b/recipes-extended/glusterfs/glusterfs_3.4.2.bb
> similarity index 100%
> rename from meta-openstack/recipes-extended/glusterfs/glusterfs_3.4.2.bb
> rename to recipes-extended/glusterfs/glusterfs_3.4.2.bb
> --
> 2.8.1
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

--f403045fba4eb68fbd05531e80f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jun 28, 2017 at 4:52 AM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"=
_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
<br>
It&#39;s not an openstack specific package.<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0.../files/0001-Fix-for-mount.<wbr>glusterfs-not-accepting-<wbr>versio=
n-argume.patch | 0<br>
=C2=A0.../recipes-extended =3D&gt; recipes-extended}/glusterfs/<wbr>files/g=
lusterd-ovp=C2=A0 =C2=A0 | 0<br>
=C2=A0.../glusterfs/files/glusterfs-<wbr>disable-default-startup-<wbr>scrip=
ts.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../glusterfs/files/xlator-<wbr>host-contamination-3.4.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../recipes-extended =3D&gt; recipes-extended}/glusterfs/<wbr>gluster=
fs.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../recipes-extended =3D&gt; recipes-extended}/glusterfs/<a href=3D"h=
ttp://glusterfs_3.4.2.bb" rel=3D"noreferrer" target=3D"_blank">gl<wbr>uster=
fs_3.4.2.bb</a>=C2=A0 =C2=A0 | 0<br>
=C2=A06 files changed, 0 insertions(+), 0 deletions(-)<br>
=C2=A0rename {meta-openstack/recipes-<wbr>extended =3D&gt; recipes-extended=
}/glusterfs/<wbr>files/0001-Fix-for-mount.<wbr>glusterfs-not-accepting-<wbr=
>version-argume.patch (100%)<br>
=C2=A0rename {meta-openstack/recipes-<wbr>extended =3D&gt; recipes-extended=
}/glusterfs/<wbr>files/glusterd-ovp (100%)<br>
=C2=A0rename {meta-openstack/recipes-<wbr>extended =3D&gt; recipes-extended=
}/glusterfs/<wbr>files/glusterfs-disable-<wbr>default-startup-scripts.patch=
 (100%)<br>
=C2=A0rename {meta-openstack/recipes-<wbr>extended =3D&gt; recipes-extended=
}/glusterfs/<wbr>files/xlator-host-<wbr>contamination-3.4.patch (100%)<br>
=C2=A0rename {meta-openstack/recipes-<wbr>extended =3D&gt; recipes-extended=
}/glusterfs/<wbr>glusterfs.inc (100%)<br>
=C2=A0rename {meta-openstack/recipes-<wbr>extended =3D&gt; recipes-extended=
}/glusterfs/<a href=3D"http://glusterfs_3.4.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gl<wbr>usterfs_3.4.2.bb</a> (100%)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>extended/glusterfs/files/0001-<wbr=
>Fix-for-mount.glusterfs-not-<wbr>accepting-version-argume.patch b/recipes-=
extended/glusterfs/<wbr>files/0001-Fix-for-mount.<wbr>glusterfs-not-accepti=
ng-<wbr>version-argume.patch<br>
similarity index 100%<br>
rename from meta-openstack/recipes-<wbr>extended/glusterfs/files/0001-<wbr>=
Fix-for-mount.glusterfs-not-<wbr>accepting-version-argume.patch<br>
rename to recipes-extended/glusterfs/<wbr>files/0001-Fix-for-mount.<wbr>glu=
sterfs-not-accepting-<wbr>version-argume.patch<br>
diff --git a/meta-openstack/recipes-<wbr>extended/glusterfs/files/<wbr>glus=
terd-ovp b/recipes-extended/glusterfs/<wbr>files/glusterd-ovp<br>
similarity index 100%<br>
rename from meta-openstack/recipes-<wbr>extended/glusterfs/files/<wbr>glust=
erd-ovp<br>
rename to recipes-extended/glusterfs/<wbr>files/glusterd-ovp<br>
diff --git a/meta-openstack/recipes-<wbr>extended/glusterfs/files/<wbr>glus=
terfs-disable-default-<wbr>startup-scripts.patch b/recipes-extended/gluster=
fs/<wbr>files/glusterfs-disable-<wbr>default-startup-scripts.patch<br>
similarity index 100%<br>
rename from meta-openstack/recipes-<wbr>extended/glusterfs/files/<wbr>glust=
erfs-disable-default-<wbr>startup-scripts.patch<br>
rename to recipes-extended/glusterfs/<wbr>files/glusterfs-disable-<wbr>defa=
ult-startup-scripts.patch<br>
diff --git a/meta-openstack/recipes-<wbr>extended/glusterfs/files/<wbr>xlat=
or-host-contamination-3.4.<wbr>patch b/recipes-extended/glusterfs/<wbr>file=
s/xlator-host-<wbr>contamination-3.4.patch<br>
similarity index 100%<br>
rename from meta-openstack/recipes-<wbr>extended/glusterfs/files/<wbr>xlato=
r-host-contamination-3.4.<wbr>patch<br>
rename to recipes-extended/glusterfs/<wbr>files/xlator-host-<wbr>contaminat=
ion-3.4.patch<br>
diff --git a/meta-openstack/recipes-<wbr>extended/glusterfs/glusterfs.<wbr>=
inc b/recipes-extended/glusterfs/<wbr>glusterfs.inc<br>
similarity index 100%<br>
rename from meta-openstack/recipes-<wbr>extended/glusterfs/glusterfs.<wbr>i=
nc<br>
rename to recipes-extended/glusterfs/<wbr>glusterfs.inc<br>
diff --git a/meta-openstack/recipes-<wbr>extended/glusterfs/<a href=3D"http=
://glusterfs_3.4.2.bb" rel=3D"noreferrer" target=3D"_blank">glusterfs_<wbr>=
3.4.2.bb</a> b/recipes-extended/glusterfs/<a href=3D"http://glusterfs_3.4.2=
.bb" rel=3D"noreferrer" target=3D"_blank">g<wbr>lusterfs_3.4.2.bb</a><br>
similarity index 100%<br>
rename from meta-openstack/recipes-<wbr>extended/glusterfs/<a href=3D"http:=
//glusterfs_3.4.2.bb" rel=3D"noreferrer" target=3D"_blank">glusterfs_<wbr>3=
.4.2.bb</a><br>
rename to recipes-extended/glusterfs/<a href=3D"http://glusterfs_3.4.2.bb" =
rel=3D"noreferrer" target=3D"_blank">glu<wbr>sterfs_3.4.2.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
--<br>
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

--f403045fba4eb68fbd05531e80f6--
