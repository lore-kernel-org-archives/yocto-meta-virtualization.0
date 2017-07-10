Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42D3CE00BC2; Mon, 10 Jul 2017 08:24:32 -0700 (PDT)
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
	*      [209.85.215.51 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.51 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F12BFE00B8B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:24:30 -0700 (PDT)
Received: by mail-lf0-f51.google.com with SMTP id z78so64881165lff.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o7e985AIK3tNQM1L+81pgvs+Tn+8wAgBGVLS+nCn1xY=;
	b=aBQqNgRIDargh/H/vbOYdn1f2BJ5cPBYCPXaQOTcHH0wawVfyxSob3CM/FMwVbU6Jj
	f4YmLONtgHQt44Rpq+z41X4rMSJcpMqBIC2nReUNZBjBmdgCNEXX2kb8cG5bjZarLE9v
	b9D1gV14bfP/KuR4XGfXStls2e2ZZdbUpgu4OU7/JEH/qvMLahjDMTfNPCQ87rBFPDdG
	Edn7zI7Qy9vkga6zAT7BvramTjWjKKi0k5bVPtsiIzK3E/2LyISCDqamPeFnTGKacv50
	Qocv+vZAUwnwhHVYi3iZ7UYX9GZvuNnrdgBIbnZ6bTMgiDUME7Nl3sWEWWDz5XkKyt9W
	Hoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o7e985AIK3tNQM1L+81pgvs+Tn+8wAgBGVLS+nCn1xY=;
	b=DCir1WftJUJQWkK03gwHjulpxbJZu/99gOfMAvTO8Itxl3w4KKj1/JLI411j4ztS3M
	Vq1rJaBuJs9+LWySiFTVvSkwPn5WLdRWDlujCKf1HqTpzr+P629cIcsXL3i1HUuSEQuv
	+npdKzxJ55LwXr19LQ6ISzkF3WgofqEW6+A3U1ocBtyqR6CuSbLvFXSPqrlOkzp6AoNS
	SB6hHEnniyNNUkfXA68CbdF+sHaE/m7XoY63s45y7TH1uP/jn2Oddr9XKYPhnl2wwFxr
	JL73RLbeh0lWD9R/tvADhP8CBK0577BZmwOzcLSEaobAoo9WON92YVz/8iVSqjjtxa4E
	9/4Q==
X-Gm-Message-State: AIVw1122ShWZeFaF+S74d+/ETrbwtIOTtnkajkCSTH7+owcNv0xwbbgY
	ISP4ZgilyDAx+ju1Ff0yYCUJENTlpFUn
X-Received: by 10.46.22.5 with SMTP id w5mr4767336ljd.26.1499700269409; Mon,
	10 Jul 2017 08:24:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Mon, 10 Jul 2017 08:24:28 -0700 (PDT)
In-Reply-To: <1499470731-26466-1-git-send-email-brian.avery@intel.com>
References: <1499470731-26466-1-git-send-email-brian.avery@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2017 11:24:28 -0400
Message-ID: <CADkTA4OBvGKf5zaNxOu00s01QThL0DmhVUtLTr-nx9K69BpM5w@mail.gmail.com>
To: brian avery <brian.avery@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: add NETFILTER_XT_MATCH_ADDRTYPE=m
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
X-List-Received-Date: Mon, 10 Jul 2017 15:24:32 -0000
Content-Type: multipart/alternative; boundary="f403045fbadad3ed710553f82de5"

--f403045fbadad3ed710553f82de5
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 7, 2017 at 7:38 PM, brian avery <brian.avery@intel.com> wrote:

> Docker needs ths _NETFILTER_XT_MATCH_ADDRTYPE module in order to start
> up successfully. This patch adds it to the supported kernels.
>
> Signed-off-by: brian avery <brian.avery@intel.com>
> ---
>  recipes-kernel/linux/linux-yocto/docker.cfg    | 1 +
>  recipes-kernel/linux/linux-yocto/docker.scc    | 4 ++++
>  recipes-kernel/linux/linux-yocto_4.1.bbappend  | 1 +
>  recipes-kernel/linux/linux-yocto_4.10.bbappend | 1 +
>  recipes-kernel/linux/linux-yocto_4.4.bbappend  | 1 +
>  recipes-kernel/linux/linux-yocto_4.9.bbappend  | 1 +
>  6 files changed, 9 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-yocto/docker.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/docker.scc
>
> diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg
> b/recipes-kernel/linux/linux-yocto/docker.cfg
> new file mode 100644
> index 0000000..d0ebb66
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/docker.cfg
> @@ -0,0 +1 @@
> +CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
>


I could have sworn that I already ported and merged my docker fragment to
meta-virt,
but it looks like I only staged it and never actually did the patch.

To make the fragment as standalone as possible, I'm running with this:

------------
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_IP_NF_FILTER=m
CONFIG_NF_NAT=m
CONFIG_NF_CONNTRACK_IPV4=y
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_OVERLAY_FS=y
-------------

I propose to update your fragment with those options and merge the changes
that
way.

Any objections ?

Bruce


> diff --git a/recipes-kernel/linux/linux-yocto/docker.scc
> b/recipes-kernel/linux/linux-yocto/docker.scc
> new file mode 100644
> index 0000000..e317456
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/docker.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Enable Features needed by docker in addition
> to LXC features"
> +define KFEATURE_COMPATIBILITY board
> +
> +kconf non-hardware docker.cfg
> diff --git a/recipes-kernel/linux/linux-yocto_4.1.bbappend
> b/recipes-kernel/linux/linux-yocto_4.1.bbappend
> index f3be89e..f163fdf 100644
> --- a/recipes-kernel/linux/linux-yocto_4.1.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.1.bbappend
> @@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://docker.scc \
>             "
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.10.bbappend
> b/recipes-kernel/linux/linux-yocto_4.10.bbappend
> index f3be89e..f163fdf 100644
> --- a/recipes-kernel/linux/linux-yocto_4.10.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.10.bbappend
> @@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://docker.scc \
>             "
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.4.bbappend
> b/recipes-kernel/linux/linux-yocto_4.4.bbappend
> index f3be89e..f163fdf 100644
> --- a/recipes-kernel/linux/linux-yocto_4.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.4.bbappend
> @@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://docker.scc \
>             "
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.9.bbappend
> b/recipes-kernel/linux/linux-yocto_4.9.bbappend
> index f3be89e..f163fdf 100644
> --- a/recipes-kernel/linux/linux-yocto_4.9.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.9.bbappend
> @@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://docker.scc \
>             "
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
> --
> 1.9.1
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

--f403045fbadad3ed710553f82de5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jul 7, 2017 at 7:38 PM, brian avery <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:brian.avery@intel.com" target=3D"_blank">brian.avery@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Docker needs ths _NETFILTER_XT_MATCH_ADDRTYPE module in order to start<br>
up successfully. This patch adds it to the supported kernels.<br>
<br>
Signed-off-by: brian avery &lt;<a href=3D"mailto:brian.avery@intel.com">bri=
an.avery@intel.com</a>&gt;<br>
---<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto/docker.cfg=C2=A0 =C2=A0 | 1 +<b=
r>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto/docker.scc=C2=A0 =C2=A0 | 4 +++=
+<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend=C2=A0 | 1 +<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend | 1 +<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend=C2=A0 | 1 +<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend=C2=A0 | 1 +<br>
=C2=A06 files changed, 9 insertions(+)<br>
=C2=A0create mode 100644 recipes-kernel/linux/linux-<wbr>yocto/docker.cfg<b=
r>
=C2=A0create mode 100644 recipes-kernel/linux/linux-<wbr>yocto/docker.scc<b=
r>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto/docker.cfg b/recipes-ker=
nel/linux/linux-<wbr>yocto/docker.cfg<br>
new file mode 100644<br>
index 0000000..d0ebb66<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto/docker.cfg<br>
@@ -0,0 +1 @@<br>
+CONFIG_NETFILTER_XT_MATCH_<wbr>ADDRTYPE=3Dm<br></blockquote><div><br></div=
><div><br></div><div>I could have sworn that I already ported and merged my=
 docker fragment to meta-virt,</div><div>but it looks like I only staged it=
 and never actually did the patch.</div><div><br></div><div>To make the fra=
gment as standalone as possible, I&#39;m running with this:</div><div><br><=
/div><div>------------</div><div>CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm<br>=
</div><div><div>CONFIG_IP_NF_FILTER=3Dm</div><div>CONFIG_NF_NAT=3Dm</div><d=
iv>CONFIG_NF_CONNTRACK_IPV4=3Dy</div><div>CONFIG_DM_THIN_PROVISIONING=3Dm<b=
r></div><div>CONFIG_IP_NF_NAT=3Dm<br></div><div>CONFIG_IP_NF_TARGET_MASQUER=
ADE=3Dm</div><div>CONFIG_OVERLAY_FS=3Dy<br></div></div><div>-------------</=
div><div><br></div><div>I propose to update your fragment with those option=
s and merge the changes that</div><div>way.</div><div><br></div><div>Any ob=
jections ?</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
diff --git a/recipes-kernel/linux/linux-<wbr>yocto/docker.scc b/recipes-ker=
nel/linux/linux-<wbr>yocto/docker.scc<br>
new file mode 100644<br>
index 0000000..e317456<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto/docker.scc<br>
@@ -0,0 +1,4 @@<br>
+define KFEATURE_DESCRIPTION &quot;Enable Features needed by docker in addi=
tion to LXC features&quot;<br>
+define KFEATURE_COMPATIBILITY board<br>
+<br>
+kconf non-hardware docker.cfg<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend b/recipes-k=
ernel/linux/linux-<wbr>yocto_4.1.bbappend<br>
index f3be89e..f163fdf 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend<br>
@@ -4,6 +4,7 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ebtables.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vswitch.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>s=
cc&quot;<br>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend b/recipes-=
kernel/linux/linux-<wbr>yocto_4.10.bbappend<br>
index f3be89e..f163fdf 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend<br>
@@ -4,6 +4,7 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ebtables.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vswitch.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>s=
cc&quot;<br>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend b/recipes-k=
ernel/linux/linux-<wbr>yocto_4.4.bbappend<br>
index f3be89e..f163fdf 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend<br>
@@ -4,6 +4,7 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ebtables.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vswitch.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>s=
cc&quot;<br>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend b/recipes-k=
ernel/linux/linux-<wbr>yocto_4.9.bbappend<br>
index f3be89e..f163fdf 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend<br>
@@ -4,6 +4,7 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ebtables.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vswitch.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>s=
cc&quot;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
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
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--f403045fbadad3ed710553f82de5--
