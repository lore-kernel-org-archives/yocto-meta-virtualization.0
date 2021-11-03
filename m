Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web09.8079.1635948429187396522
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 07:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gSgmkSnr;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id e2so3983108ljg.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Nov 2021 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S5yE6i+mlUBqLMZbf5++Y21dAnkmJuS4kkAiNkH1Azc=;
        b=gSgmkSnrPdj93rxyhW+v/s3ykV3sj/YxoJyjklwwrJHtRLmtme19Kc4ROQLA1StqKn
         /4wG36WYNkXXlZDzkwTcNpT9HKQOH808Oc6EMfVSkSopnJrzXql2EdJD1tnLo7qC0S/y
         DCaKLuUrhL6tInnfaThKh92ZXNfT8FtTmGqjrbJpga8lU03b+6w+Lw7xhjq6UOa9DGR/
         A5yh2qiXRTV9cngty0deEsJEVHWI28Tovl4/PzkW2EC5N3c51tbB31h0yxbXjw+VdqOa
         TmqzKw16NXyKx2Mykv3E+s6ASP/ep3vIN3KNuC4NFnOesEHXdE3A1IKHCQBoWdINqfWP
         sTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S5yE6i+mlUBqLMZbf5++Y21dAnkmJuS4kkAiNkH1Azc=;
        b=O7edsckj0oQncyL2GTw2a82D5ndKkhlcRzhpNnp2aVBsVoxNKpO0Hg4sTXHYczlw9r
         1Gi1mavEeWSNulf0mT1q8Rp3iMRAFLKcODTCllCbR3CB80wgHS60kNYMIXjxRmqcbE1U
         Qh69vv4nyGobhHU8hmzfMdZafVdxz2E+CqlXiii9QVkzODSxovaCgABVFl/POBgE4J1l
         95kz4nOJAsf7JqLaV78uVrApd2uS6EfSlo4Use/EWo7RgLbsj+GLGsWz/XObjbTcRwMZ
         1brMhCXypx/HR6QlqdpK3rPhMGHthr/BTXlOBYKPQLAyXZWLtzk7V6fbvoydgDq90+Ox
         xduw==
X-Gm-Message-State: AOAM532hxXkwgkQIhQgTbd46bWFWkH5EUPzYAJkVE0qG3IotvnPjntY7
	xGfys0Hew9n9OcpcSODIbS8LBB4J9RkBDbo3VMs7YqMaB/c=
X-Google-Smtp-Source: ABdhPJzFX2cU0eOMJzOLoa7RNNmWtViZF+BwpDDNMsYbOqdBGwGOC6hBM0LIdFi+JlvwKbLSjKxIQOHGXmFjcKtQK60=
X-Received: by 2002:a05:651c:b29:: with SMTP id b41mr3725513ljr.38.1635948425783;
 Wed, 03 Nov 2021 07:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <16B40ADAB1425D6F.25986@lists.yoctoproject.org> <AM6PR08MB3893969F8DFD435A138516FDE08C9@AM6PR08MB3893.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB3893969F8DFD435A138516FDE08C9@AM6PR08MB3893.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 3 Nov 2021 10:06:54 -0400
Message-ID: <CADkTA4P4cTGxdBhq=kDx2K6y4N2Tu6gbEKHVf33K653ex8ydjA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] k3s: Add additional required kernel modules
To: Richard Neill <richard.neill@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000ca2cdc05cfe2ecab"

--000000000000ca2cdc05cfe2ecab
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 3, 2021 at 9:05 AM Richard Neill <richard.neill@arm.com> wrote:

> Hi,
>
> If possible, could this patch also be added to the honister branch?
>

It's just  configuration tweak, so I can do that.

I have some other k3s changes in flight (version bumps, packaging and
unifying of configuration into the main config repository), but I've added
these and expect to push them in a few days.

Bruce



>
> Thanks,
> Richard
> ------------------------------
> *From:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org> on behalf of Richard Neill
> via lists.yoctoproject.org <richard.neill=arm.com@lists.yoctoproject.org>
> *Sent:* Wednesday, November 3, 2021 1:01 PM
> *To:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>
> *Cc:* nd <nd@arm.com>
> *Subject:* [meta-virtualization] [PATCH] k3s: Add additional required
> kernel modules
>
> Adds the following kernel modules for k3s:
>
> * xt-physdev
> * xt-nflog
> * xt-limit
> * nfnetlink-log
>
> Without them, the k3s network-policy-controller reports failures in the log
> related to iptables-restore.
>
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> ---
>  recipes-containers/k3s/k3s_git.bb               | 4 ++++
>  recipes-kernel/linux/linux-yocto/kubernetes.cfg | 8 ++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/
> k3s_git.bb
> index e341ad7..4e1cf64 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -96,6 +96,10 @@ RRECOMMENDS:${PN} = "\
>                       kernel-module-vxlan \
>                       kernel-module-xt-masquerade \
>                       kernel-module-xt-statistic \
> +                     kernel-module-xt-physdev \
> +                     kernel-module-xt-nflog \
> +                     kernel-module-xt-limit \
> +                     kernel-module-nfnetlink-log \
>                       "
>
>  RCONFLICTS:${PN} = "kubectl"
> diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.cfg
> b/recipes-kernel/linux/linux-yocto/kubernetes.cfg
> index 2d4e1f5..84fa8c5 100644
> --- a/recipes-kernel/linux/linux-yocto/kubernetes.cfg
> +++ b/recipes-kernel/linux/linux-yocto/kubernetes.cfg
> @@ -13,9 +13,14 @@ CONFIG_IP_VS_NFCT=y
>  CONFIG_IP_VS_PROTO_TCP=y
>  CONFIG_IP_VS_PROTO_UDP=y
>  CONFIG_IP_VS_RR=m
> +CONFIG_NETFILTER_NETLINK_LOG=m
> +CONFIG_NETFILTER_XT_CONNMARK=m
>  CONFIG_NETFILTER_XT_MATCH_COMMENT=m
> +CONFIG_NETFILTER_XT_MATCH_LIMIT=m
>  CONFIG_NETFILTER_XT_MATCH_MARK=m
> -CONFIG_NETFILTER_XT_CONNMARK=m
> +CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
> +CONFIG_NETFILTER_XT_TARGET_NFLOG=m
> +CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
>  CONFIG_NAMESPACES=y
>  CONFIG_NET_NS=y
>  CONFIG_PID_NS=y
> @@ -32,4 +37,3 @@ CONFIG_MEMCG=y
>  CONFIG_INET=y
>  CONFIG_EXT4_FS=y
>  CONFIG_PROC_FS=y
> -CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
> --
> 2.25.1
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ca2cdc05cfe2ecab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 9:05 AM Richard Neill &lt;<a=
 href=3D"mailto:richard.neill@arm.com">richard.neill@arm.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi, <br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
If possible, could this patch also be added to the honister branch?</div></=
div></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">It&#39;s just=C2=A0 configuration tweak, so I can do that.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">I have some other k3s ch=
anges in flight (version bumps, packaging and unifying of configuration int=
o the main config repository), but I&#39;ve added these and expect to push =
them in a few days.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce=
</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Richard<br>
</div>
<div id=3D"gmail-m_-942084610329079488appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_-942084610329079488divRplyFwdMsg" dir=3D"ltr"><font face=
=3D"Calibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From=
:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=
=3D"_blank">meta-virtualization@lists.yoctoproject.org</a> &lt;<a href=3D"m=
ailto:meta-virtualization@lists.yoctoproject.org" target=3D"_blank">meta-vi=
rtualization@lists.yoctoproject.org</a>&gt; on behalf of Richard Neill via =
<a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproj=
ect.org</a>
 &lt;richard.neill=3D<a href=3D"mailto:arm.com@lists.yoctoproject.org" targ=
et=3D"_blank">arm.com@lists.yoctoproject.org</a>&gt;<br>
<b>Sent:</b> Wednesday, November 3, 2021 1:01 PM<br>
<b>To:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a> &lt;<a href=
=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=3D"_blank">me=
ta-virtualization@lists.yoctoproject.org</a>&gt;<br>
<b>Cc:</b> nd &lt;<a href=3D"mailto:nd@arm.com" target=3D"_blank">nd@arm.co=
m</a>&gt;<br>
<b>Subject:</b> [meta-virtualization] [PATCH] k3s: Add additional required =
kernel modules</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>Adds the following kernel modules for k3s:<br>
<br>
* xt-physdev<br>
* xt-nflog<br>
* xt-limit<br>
* nfnetlink-log<br>
<br>
Without them, the k3s network-policy-controller reports failures in the log=
<br>
related to iptables-restore.<br>
<br>
Signed-off-by: Richard Neill &lt;<a href=3D"mailto:richard.neill@arm.com" t=
arget=3D"_blank">richard.neill@arm.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/k3s/<a href=3D"http://k3s_git.bb" target=3D"_blank=
">k3s_git.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++<br>
=C2=A0recipes-kernel/linux/linux-yocto/kubernetes.cfg | 8 ++++++--<br>
=C2=A02 files changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" target=3D=
"_blank">k3s_git.bb</a> b/recipes-containers/k3s/<a href=3D"http://k3s_git.=
bb" target=3D"_blank">k3s_git.bb</a><br>
index e341ad7..4e1cf64 100644<br>
--- a/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" target=3D"_blank=
">k3s_git.bb</a><br>
+++ b/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" target=3D"_blank=
">k3s_git.bb</a><br>
@@ -96,6 +96,10 @@ RRECOMMENDS:${PN} =3D &quot;\<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-module-vxlan \<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-module-xt-masque=
rade \<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-module-xt-statis=
tic \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-module-xt-physdev \=
<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-module-xt-nflog \<b=
r>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-module-xt-limit \<b=
r>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-module-nfnetlink-lo=
g \<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>
<br>
=C2=A0RCONFLICTS:${PN} =3D &quot;kubectl&quot;<br>
diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.cfg b/recipes-kern=
el/linux/linux-yocto/kubernetes.cfg<br>
index 2d4e1f5..84fa8c5 100644<br>
--- a/recipes-kernel/linux/linux-yocto/kubernetes.cfg<br>
+++ b/recipes-kernel/linux/linux-yocto/kubernetes.cfg<br>
@@ -13,9 +13,14 @@ CONFIG_IP_VS_NFCT=3Dy<br>
=C2=A0CONFIG_IP_VS_PROTO_TCP=3Dy<br>
=C2=A0CONFIG_IP_VS_PROTO_UDP=3Dy<br>
=C2=A0CONFIG_IP_VS_RR=3Dm<br>
+CONFIG_NETFILTER_NETLINK_LOG=3Dm<br>
+CONFIG_NETFILTER_XT_CONNMARK=3Dm<br>
=C2=A0CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm<br>
+CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm<br>
=C2=A0CONFIG_NETFILTER_XT_MATCH_MARK=3Dm<br>
-CONFIG_NETFILTER_XT_CONNMARK=3Dm<br>
+CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm<br>
+CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm<br>
+CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm<br>
=C2=A0CONFIG_NAMESPACES=3Dy<br>
=C2=A0CONFIG_NET_NS=3Dy<br>
=C2=A0CONFIG_PID_NS=3Dy<br>
@@ -32,4 +37,3 @@ CONFIG_MEMCG=3Dy<br>
=C2=A0CONFIG_INET=3Dy<br>
=C2=A0CONFIG_EXT4_FS=3Dy<br>
=C2=A0CONFIG_PROC_FS=3Dy<br>
-CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm<br>
--<br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>

<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000ca2cdc05cfe2ecab--
