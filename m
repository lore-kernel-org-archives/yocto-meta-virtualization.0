Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C777E00BB6; Mon, 10 Jul 2017 09:04:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.54 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.54 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E21B8E00B76
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 09:04:05 -0700 (PDT)
Received: by mail-lf0-f54.google.com with SMTP id b207so65689532lfg.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 09:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nZ94NClruI0Nco40MtOmYYt/LCocKVwJCj3wmuOZ39w=;
	b=L+WyR0SZ/8qS/iyDKa84YOf5t/ODI2yb/8WeOE0Y2iJhLvn/Lk4VdPjMoX6USVsKQs
	uC91onWBPx6ss3A/FWS02KLxSsOShwN4PMF+KPB14Q3ELrrSv7PIU81SJBavvLtzg3xh
	1+I65o8PU7XDH6YTJENfdFziAPZd2ebWdrXQpwtWaAUEd0etTJDXH3cuUBJflI7uoiRA
	wMZyxxC+vS36z9IAddM5I2LIQ1uNKmf/cfExYLIRTYhnrH7AB+EG94M6ZF1VAZ8DAe2m
	IDthYe7GoE7owb+VI3hMmnnTlL7jEYcK/OgvCIQGwkrVZYY4gZiK6hM5uUEwBp00n5Le
	VT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nZ94NClruI0Nco40MtOmYYt/LCocKVwJCj3wmuOZ39w=;
	b=bFyYjuPkHjwhcjkvJKcw5f+GzV+vFfn5MUiae3xVth4Yul6zLJzFImEQU4PyLo+7oS
	Rmp72ZuFQv4FLOn9RaoBEbg7bCRnUYYyDsmlUpWA6QP08pq5KE1Q+p1FTFu1Tv3IGZ/a
	1RuSgcibKbVjoX87iRMVIxbsekmN8btqj9/9K9cAhJxUMexr+Q+tv+Jf9/YClolX9UY+
	3Grkr7fNt3gN3OfPMnpAGemSGFBfriKIt3DYgMc2Fj21M7iG8MfztEwLhCbY7W8mPlgR
	IhTldtgba9mMwEZBG2k6sXf/fGpDgHz+CaZNTTDsN769Napr0MYWv7L9iSWXmZEJC5Qz
	/Sng==
X-Gm-Message-State: AIVw112fjF0hn0mNJgXu0IfR6JUzTEo3o5whtVT7NmHECsETO8qKX5PA
	RUtSEH6P562lEXW55iFR14a/qVm1Yw==
X-Received: by 10.25.1.130 with SMTP id 124mr1338403lfb.138.1499702644649;
	Mon, 10 Jul 2017 09:04:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Mon, 10 Jul 2017 09:04:03 -0700 (PDT)
In-Reply-To: <C60BE286-B2C9-4933-B3EE-C11691583D10@intel.com>
References: <1499470731-26466-1-git-send-email-brian.avery@intel.com>
	<CADkTA4OBvGKf5zaNxOu00s01QThL0DmhVUtLTr-nx9K69BpM5w@mail.gmail.com>
	<3CA7AF00-AEB9-46BC-9E5C-CB2586AAEA39@intel.com>
	<CB9E7417-A7AD-45AC-AE41-8EFA8907B430@intel.com>
	<CADkTA4MACyFTkS-E6_zTa+pupwNG9k86NJupbXBw1NZEAb24yw@mail.gmail.com>
	<C60BE286-B2C9-4933-B3EE-C11691583D10@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2017 12:04:03 -0400
Message-ID: <CADkTA4Pq=V19hD39pKkgdMQXSj9qZxJ2xRa9Fw6akdMh9KWw-w@mail.gmail.com>
To: "Avery, Brian" <brian.avery@intel.com>
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
X-List-Received-Date: Mon, 10 Jul 2017 16:04:07 -0000
Content-Type: multipart/alternative; boundary="001a113c9e9a6736dc0553f8bb8b"

--001a113c9e9a6736dc0553f8bb8b
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 10, 2017 at 11:53 AM, Avery, Brian <brian.avery@intel.com>
wrote:

> /usr/share/docker/check-config.sh
>
> works and is in docker-contrib :).
>


Cool. And no worries .. I never doubt that a bug has crept in and I didn't
notice it.

Also, there are some pending updates to docker/moby bits and the plumbing,
but they are causing
issues at the system level, so its going to be  bit longer for updates. But
the packaging will stay
the same.

Cheers,

Bruce


My miss,
>
> -b
>
>
>
> *From: *Bruce Ashfield <bruce.ashfield@gmail.com>
> *Date: *Monday, July 10, 2017 at 8:44 AM
>
> *To: *"Avery, Brian" <brian.avery@intel.com>
> *Cc: *"meta-virtualization@yoctoproject.org" <meta-virtualization@
> yoctoproject.org>
> *Subject: *Re: [meta-virtualization] [PATCH] docker: add
> NETFILTER_XT_MATCH_ADDRTYPE=m
>
>
>
>
>
>
>
> On Mon, Jul 10, 2017 at 11:40 AM, Avery, Brian <brian.avery@intel.com>
> wrote:
>
> One other thought/question: should we include the docker check-config
> tool? would make it easier for people to track these things down if it
> changes in the future.
>
>
>
>
>
> It is currently in the docker-contrib package, since we didn't want it to
> be always on target. Have you tried including that and it is otherwise
> broken ?
>
>
>
> Bruce
>
>
>
> -b
>
>
>
> *From: *<meta-virtualization-bounces@yoctoproject.org> on behalf of
> "Avery, Brian" <brian.avery@intel.com>
> *Date: *Monday, July 10, 2017 at 8:37 AM
> *To: *Bruce Ashfield <bruce.ashfield@gmail.com>
>
>
> *Cc: *"meta-virtualization@yoctoproject.org" <meta-virtualization@
> yoctoproject.org>
> *Subject: *Re: [meta-virtualization] [PATCH] docker: add
> NETFILTER_XT_MATCH_ADDRTYPE=m
>
>
>
> Works for me.
>
> ty :)
>
> -b
>
>
>
> p.s. working on this did hit bug https://bugzilla.yoctoproject.
> org/show_bug.cgi?id=8191 when I tried to use linux-intel instead of
> linux-yocto.
>
>
>
>
>
> *From: *Bruce Ashfield <bruce.ashfield@gmail.com>
> *Date: *Monday, July 10, 2017 at 8:24 AM
> *To: *"Avery, Brian" <brian.avery@intel.com>
> *Cc: *"meta-virtualization@yoctoproject.org" <meta-virtualization@
> yoctoproject.org>
> *Subject: *Re: [meta-virtualization] [PATCH] docker: add
> NETFILTER_XT_MATCH_ADDRTYPE=m
>
>
>
>
>
>
>
> On Fri, Jul 7, 2017 at 7:38 PM, brian avery <brian.avery@intel.com> wrote:
>
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
>
>
>
>
> I could have sworn that I already ported and merged my docker fragment to
> meta-virt,
>
> but it looks like I only staged it and never actually did the patch.
>
>
>
> To make the fragment as standalone as possible, I'm running with this:
>
>
>
> ------------
>
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
>
> CONFIG_IP_NF_FILTER=m
>
> CONFIG_NF_NAT=m
>
> CONFIG_NF_CONNTRACK_IPV4=y
>
> CONFIG_DM_THIN_PROVISIONING=m
>
> CONFIG_IP_NF_NAT=m
>
> CONFIG_IP_NF_TARGET_MASQUERADE=m
>
> CONFIG_OVERLAY_FS=y
>
> -------------
>
>
>
> I propose to update your fragment with those options and merge the changes
> that
>
> way.
>
>
>
> Any objections ?
>
>
>
> Bruce
>
>
>
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
>
>
>
>
> --
>
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>
>
>
>
> --
>
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113c9e9a6736dc0553f8bb8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jul 10, 2017 at 11:53 AM, Avery, Brian <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:brian.avery@intel.com" target=3D"_blank">brian.avery@intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">







<div bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-6544274957245971746WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
>/usr/share/docker/check-<wbr>config.sh<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
>works and is in docker-contrib :).</span></p></div></div></blockquote><div=
><br></div><div><br></div><div>Cool. And no worries .. I never doubt that a=
 bug has crept in and I didn&#39;t notice it.</div><div><br></div><div>Also=
, there are some pending updates to docker/moby bits and the plumbing, but =
they are causing</div><div>issues at the system level, so its going to be =
=C2=A0bit longer for updates. But the packaging will stay</div><div>the sam=
e.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><di=
v><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"w=
hite" lang=3D"EN-US" link=3D"blue" vlink=3D"purple"><div class=3D"m_-654427=
4957245971746WordSection1"><p class=3D"MsoNormal"><span style=3D"font-size:=
11.0pt;font-family:Calibri">
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
>My miss,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
>-b<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
><u></u>=C2=A0<u></u></span></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><b><span style=3D"font-fa=
mily:Calibri;color:black">From:
</span></b><span style=3D"font-family:Calibri;color:black">Bruce Ashfield &=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashf=
ield@gmail.com</a>&gt;<br>
<b>Date: </b>Monday, July 10, 2017 at 8:44 AM</span></p><div><div class=3D"=
h5"><br>
<b>To: </b>&quot;Avery, Brian&quot; &lt;<a href=3D"mailto:brian.avery@intel=
.com" target=3D"_blank">brian.avery@intel.com</a>&gt;<br>
<b>Cc: </b>&quot;<a href=3D"mailto:meta-virtualization@yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@<wbr>yoctoproject.org</a>&quot; &lt;<a =
href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">meta=
-virtualization@<wbr>yoctoproject.org</a>&gt;<br>
<b>Subject: </b>Re: [meta-virtualization] [PATCH] docker: add NETFILTER_XT_=
MATCH_ADDRTYPE=3Dm<u></u><u></u></div></div><p></p>
</div><div><div class=3D"h5">
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">On Mon, Jul 10, 2017 at 1=
1:40 AM, Avery, Brian &lt;<a href=3D"mailto:brian.avery@intel.com" target=
=3D"_blank">brian.avery@intel.com</a>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:Calibri">One other thought/ques=
tion: should we include the docker check-config tool? would make it easier =
for people to track these things down if it changes in the future.</span><u=
></u><u></u></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">It is currently in the do=
cker-contrib package, since we didn&#39;t want it to be always on target. H=
ave you tried including that and it is otherwise broken ?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Bruce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:Calibri">-b</span><u></u><u></u=
></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">
<span style=3D"font-size:11.0pt;font-family:Calibri">=C2=A0</span><u></u><u=
></u></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
<b><span style=3D"font-family:Calibri;color:black">From: </span></b><span s=
tyle=3D"font-family:Calibri;color:black">&lt;<a href=3D"mailto:meta-virtual=
ization-bounces@yoctoproject.org" target=3D"_blank">meta-virtualization-bou=
nces@<wbr>yoctoproject.org</a>&gt; on behalf of &quot;Avery,
 Brian&quot; &lt;<a href=3D"mailto:brian.avery@intel.com" target=3D"_blank"=
>brian.avery@intel.com</a>&gt;<br>
<b>Date: </b>Monday, July 10, 2017 at 8:37 AM<br>
<b>To: </b>Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span><u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><br>
<b>Cc: </b>&quot;<a href=3D"mailto:meta-virtualization@yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@<wbr>yoctoproject.org</a>&quot; &lt;<a =
href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">meta=
-virtualization@<wbr>yoctoproject.org</a>&gt;<br>
<b>Subject: </b>Re: [meta-virtualization] [PATCH] docker: add NETFILTER_XT_=
MATCH_ADDRTYPE=3Dm<u></u><u></u></p>
</div>
</div>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
=C2=A0<u></u><u></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
<span style=3D"font-size:11.0pt;font-family:Calibri">Works for me.</span><u=
></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
<span style=3D"font-size:11.0pt;font-family:Calibri">ty :)</span><u></u><u>=
</u></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
<span style=3D"font-size:11.0pt;font-family:Calibri">-b</span><u></u><u></u=
></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
<span style=3D"font-size:11.0pt;font-family:Calibri">=C2=A0</span><u></u><u=
></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
<span style=3D"font-size:11.0pt;font-family:Calibri">p.s. working on this d=
id hit bug
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8191" target=
=3D"_blank">
https://bugzilla.yoctoproject.<wbr>org/show_bug.cgi?id=3D8191</a> when I tr=
ied to use linux-intel instead of linux-yocto.
</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
<span style=3D"font-size:11.0pt;font-family:Calibri">=C2=A0</span><u></u><u=
></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">
<span style=3D"font-size:11.0pt;font-family:Calibri">=C2=A0</span><u></u><u=
></u></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
<b><span style=3D"font-family:Calibri;color:black">From: </span></b><span s=
tyle=3D"font-family:Calibri;color:black">Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>=
&gt;<br>
<b>Date: </b>Monday, July 10, 2017 at 8:24 AM<br>
<b>To: </b>&quot;Avery, Brian&quot; &lt;<a href=3D"mailto:brian.avery@intel=
.com" target=3D"_blank">brian.avery@intel.com</a>&gt;<br>
<b>Cc: </b>&quot;<a href=3D"mailto:meta-virtualization@yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@<wbr>yoctoproject.org</a>&quot; &lt;<a =
href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">meta=
-virtualization@<wbr>yoctoproject.org</a>&gt;<br>
<b>Subject: </b>Re: [meta-virtualization] [PATCH] docker: add NETFILTER_XT_=
MATCH_ADDRTYPE=3Dm</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
On Fri, Jul 7, 2017 at 7:38 PM, brian avery &lt;<a href=3D"mailto:brian.ave=
ry@intel.com" target=3D"_blank">brian.avery@intel.com</a>&gt; wrote:<u></u>=
<u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
Docker needs ths _NETFILTER_XT_MATCH_ADDRTYPE module in order to start<br>
up successfully. This patch adds it to the supported kernels.<br>
<br>
Signed-off-by: brian avery &lt;<a href=3D"mailto:brian.avery@intel.com" tar=
get=3D"_blank">brian.avery@intel.com</a>&gt;<br>
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
+CONFIG_NETFILTER_XT_MATCH_<wbr>ADDRTYPE=3Dm<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
I could have sworn that I already ported and merged my docker fragment to m=
eta-virt,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
but it looks like I only staged it and never actually did the patch.<u></u>=
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
To make the fragment as standalone as possible, I&#39;m running with this:<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
------------<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
CONFIG_NETFILTER_XT_MATCH_<wbr>ADDRTYPE=3Dm<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
CONFIG_IP_NF_FILTER=3Dm<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
CONFIG_NF_NAT=3Dm<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
CONFIG_NF_CONNTRACK_IPV4=3Dy<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
CONFIG_DM_THIN_PROVISIONING=3Dm<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
CONFIG_IP_NF_NAT=3Dm<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
CONFIG_IP_NF_TARGET_<wbr>MASQUERADE=3Dm<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
CONFIG_OVERLAY_FS=3Dy<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
-------------<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
I propose to update your fragment with those options and merge the changes =
that<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
way.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
Any objections ?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
Bruce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
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
<span style=3D"color:#888888"><br>
<span class=3D"m_-6544274957245971746m-1851879645393704427gmail-hoenzb">--<=
/span><br>
<span class=3D"m_-6544274957245971746m-1851879645393704427gmail-hoenzb">1.9=
.1</span><br>
<br>
<span class=3D"m_-6544274957245971746m-1851879645393704427gmail-hoenzb">--<=
/span><br>
<span class=3D"m_-6544274957245971746m-1851879645393704427gmail-hoenzb">___=
___________________________<wbr>_________________</span><br>
<span class=3D"m_-6544274957245971746m-1851879645393704427gmail-hoenzb">met=
a-virtualization mailing list</span><br>
<span class=3D"m_-6544274957245971746m-1851879645393704427gmail-hoenzb"><a =
href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">meta=
-virtualization@<wbr>yoctoproject.org</a></span><br>
<span class=3D"m_-6544274957245971746m-1851879645393704427gmail-hoenzb"><a =
href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" target=
=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/meta-<wbr>virtuali=
zation</a></span></span><u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
<br>
<br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
=C2=A0<u></u><u></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.5in">
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><br>
<br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&quot;Thou shalt not foll=
ow the NULL pointer, for chaos and madness await thee at its end&quot;<u></=
u><u></u></p>
</div>
</div>
</div>
</div></div></div>
</div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a113c9e9a6736dc0553f8bb8b--
