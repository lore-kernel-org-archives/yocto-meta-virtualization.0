Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55CE6E00CF9; Fri, 22 Sep 2017 05:13:25 -0700 (PDT)
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
	*      [209.85.220.177 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.177 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB861E00CB4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Sep 2017 05:13:23 -0700 (PDT)
Received: by mail-qk0-f177.google.com with SMTP id g128so786770qke.13
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Sep 2017 05:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7dXSj2U3Pz5ysO1Z3GFFjxHWOSAI9o0iKNJuUp7jlEk=;
	b=H06IWbV7rZmXZWeCeCgL4M1ys3P7dqnpgSqio8rURNrzZfikTyEnVP3PvNLDW9+hAq
	SYFf6uWw4rvS7gsTPneH6WWgvuXXNENXb6KQMH5v3/dpFqXUSa3h1FoVfTRX9PTCI+QB
	GUXe5aZtn/9MM2O98OTnvouq8U790r/iZLHrJQHggbNw24qQV7LLDVMkS/PEGS1a4rge
	Gjkc7dl+J6wHbNHnfAUqEnu1clf/g5pymtdZwfmj7OZrwaLkdEva/E3mbGqHUyNLZ/u3
	Y6n8BJzRFpBoFpYCQn7nwtN47VM99zOP9VerbvapOSqxzQJjvVOrDu8zBzk4a8A8Aop6
	qKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7dXSj2U3Pz5ysO1Z3GFFjxHWOSAI9o0iKNJuUp7jlEk=;
	b=LBChyx5T60bnekczGZ57+QrTuyTtu257XKEd+WnlBi7busQqG+FFhE0nKh65FN9Zey
	A8HEggfoLMpM37XMSELiTv7nEnSgbdb0TlIGRD8fsHmwJPSQWt8gBMZGA4eeE/YJObKp
	acYOpXibgBhHeZ8nbP/TOIHvAhRx2cAG/mWwWd7ODq1eEJDpdSmbKjItAqid87CwL5qW
	9tvTbLMeYBWvG7xKDccThCbThohPzVFwTY76/t5SVEHrp0f0kicjPIbr7+7nHQWqynPd
	t6js+oQKxglN6+YUFWEWD369DHLu3QyUoNMOxcmrtPM4/4u++pr7rZaF7rcmtQJ+/ulJ
	/VZA==
X-Gm-Message-State: AHPjjUjnC+qGZoQqcjkAkeQ6wnlRTGkTkP4en1pMl6SwUKdIbx3tjo1P
	XKerWdk9sCzakcHIXllyoe/iEioSdBwVKFK2k0c=
X-Google-Smtp-Source: AOwi7QChZzX5V0eSscfLbnb8pzlbNv086tXPbPLXEGqvekSo8A268Ty2FtxwpfjX0R2KV+Y9p32uDMkwKhNz8woJejI=
X-Received: by 10.55.159.130 with SMTP id i124mr7620639qke.339.1506082402812; 
	Fri, 22 Sep 2017 05:13:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Fri, 22 Sep 2017 05:13:22 -0700 (PDT)
In-Reply-To: <20170922082637.13578-1-Qi.Chen@windriver.com>
References: <20170922082637.13578-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 22 Sep 2017 08:13:22 -0400
Message-ID: <CADkTA4P7+rrUu=8Q3CfcoHpFQzJWzpn2ZVNRb-gP1gNds8Edwg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] linux-yocto: make bbappend have effect conditionally
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
X-List-Received-Date: Fri, 22 Sep 2017 12:13:25 -0000
Content-Type: multipart/alternative; boundary="001a114d38ee9f47c00559c62264"

--001a114d38ee9f47c00559c62264
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 22, 2017 at 4:26 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Make these bbappend files to take effect only when DISTRO_FEATURES
> contain 'virtualization'. Otherwise, we would meet failure failure
> at system booting up qemux86. Related logs are as below.
>
>  systemd-modules-load[113]: Failed to insert 'kvm_amd': Operation not
> supported
>  systemd-modules-load[113]: Failed to insert 'kvm_intel': Operation not
> supported
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto_4.10.bbappend      | 21
> +--------------------
>  recipes-kernel/linux/linux-yocto_4.12.bbappend      | 21
> +--------------------
>  recipes-kernel/linux/linux-yocto_4.4.bbappend       | 21
> +--------------------
>  recipes-kernel/linux/linux-yocto_4.9.bbappend       | 21
> +--------------------
>  recipes-kernel/linux/linux-yocto_virtualization.inc | 20
> ++++++++++++++++++++
>  5 files changed, 24 insertions(+), 80 deletions(-)
>  create mode 100644 recipes-kernel/linux/linux-yocto_virtualization.inc
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.10.bbappend
> b/recipes-kernel/linux/linux-yocto_4.10.bbappend
> index f163fdf..617cacc 100644
> --- a/recipes-kernel/linux/linux-yocto_4.10.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.10.bbappend
> @@ -1,20 +1 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://xt-checksum.scc \
> -            file://ebtables.scc \
> -           file://vswitch.scc \
> -           file://lxc.scc \
> -            file://docker.scc \
> -           "
> -KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> -
> -KERNEL_MODULE_AUTOLOAD += "openvswitch"
> -KERNEL_MODULE_AUTOLOAD += "kvm"
> -KERNEL_MODULE_AUTOLOAD += "kvm-amd"
> -KERNEL_MODULE_AUTOLOAD += "kvm-intel"
> -
> -# aufs kernel support required for xen-image-minimal
> -KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> -
> -# xen kernel support
> -SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
> '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-kernel/linux/linux-yocto_4.12.bbappend
> b/recipes-kernel/linux/linux-yocto_4.12.bbappend
> index f163fdf..617cacc 100644
> --- a/recipes-kernel/linux/linux-yocto_4.12.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.12.bbappend
> @@ -1,20 +1 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://xt-checksum.scc \
> -            file://ebtables.scc \
> -           file://vswitch.scc \
> -           file://lxc.scc \
> -            file://docker.scc \
> -           "
> -KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> -
> -KERNEL_MODULE_AUTOLOAD += "openvswitch"
> -KERNEL_MODULE_AUTOLOAD += "kvm"
> -KERNEL_MODULE_AUTOLOAD += "kvm-amd"
> -KERNEL_MODULE_AUTOLOAD += "kvm-intel"
> -
> -# aufs kernel support required for xen-image-minimal
> -KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> -
> -# xen kernel support
> -SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
> '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-kernel/linux/linux-yocto_4.4.bbappend
> b/recipes-kernel/linux/linux-yocto_4.4.bbappend
> index f163fdf..617cacc 100644
> --- a/recipes-kernel/linux/linux-yocto_4.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.4.bbappend
> @@ -1,20 +1 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://xt-checksum.scc \
> -            file://ebtables.scc \
> -           file://vswitch.scc \
> -           file://lxc.scc \
> -            file://docker.scc \
> -           "
> -KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> -
> -KERNEL_MODULE_AUTOLOAD += "openvswitch"
> -KERNEL_MODULE_AUTOLOAD += "kvm"
> -KERNEL_MODULE_AUTOLOAD += "kvm-amd"
> -KERNEL_MODULE_AUTOLOAD += "kvm-intel"
> -
> -# aufs kernel support required for xen-image-minimal
> -KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> -
> -# xen kernel support
> -SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
> '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-kernel/linux/linux-yocto_4.9.bbappend
> b/recipes-kernel/linux/linux-yocto_4.9.bbappend
> index f163fdf..617cacc 100644
> --- a/recipes-kernel/linux/linux-yocto_4.9.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.9.bbappend
> @@ -1,20 +1 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += "file://xt-checksum.scc \
> -            file://ebtables.scc \
> -           file://vswitch.scc \
> -           file://lxc.scc \
> -            file://docker.scc \
> -           "
> -KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> -
> -KERNEL_MODULE_AUTOLOAD += "openvswitch"
> -KERNEL_MODULE_AUTOLOAD += "kvm"
> -KERNEL_MODULE_AUTOLOAD += "kvm-amd"
> -KERNEL_MODULE_AUTOLOAD += "kvm-intel"
> -
> -# aufs kernel support required for xen-image-minimal
> -KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> -
> -# xen kernel support
> -SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
> '${BPN}_virtualization.inc', '', d)}
>

But now you've just made up a random distro flag that no one uses and will
impact every existing build of meta-virtualization.

so no, I won't merge this just to fix a boot with a qemu machine. There must
be a better solution. i.e. make a flag opt-out of using the loads, and
throw a
warning and we can transition to something like you have above over time.

Bruce


> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc
> b/recipes-kernel/linux/linux-yocto_virtualization.inc
> new file mode 100644
> index 0000000..f163fdf
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -0,0 +1,20 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += "file://xt-checksum.scc \
> +            file://ebtables.scc \
> +           file://vswitch.scc \
> +           file://lxc.scc \
> +            file://docker.scc \
> +           "
> +KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> +
> +KERNEL_MODULE_AUTOLOAD += "openvswitch"
> +KERNEL_MODULE_AUTOLOAD += "kvm"
> +KERNEL_MODULE_AUTOLOAD += "kvm-amd"
> +KERNEL_MODULE_AUTOLOAD += "kvm-intel"
> +
> +# aufs kernel support required for xen-image-minimal
> +KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
> +
> +# xen kernel support
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
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

--001a114d38ee9f47c00559c62264
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Sep 22, 2017 at 4:26 AM, Chen Qi <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Make these bbappend =
files to take effect only when DISTRO_FEATURES<br>
contain &#39;virtualization&#39;. Otherwise, we would meet failure failure<=
br>
at system booting up qemux86. Related logs are as below.<br>
<br>
=C2=A0systemd-modules-load[113]: Failed to insert &#39;kvm_amd&#39;: Operat=
ion not supported<br>
=C2=A0systemd-modules-load[113]: Failed to insert &#39;kvm_intel&#39;: Oper=
ation not supported<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend=C2=A0 =C2=A0 =C2=
=A0 | 21 +--------------------<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.12.bbappend=C2=A0 =C2=A0 =C2=
=A0 | 21 +--------------------<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 21 +--------------------<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 21 +--------------------<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_virtualization.inc | 20 +++++++=
+++++++++++++<br>
=C2=A05 files changed, 24 insertions(+), 80 deletions(-)<br>
=C2=A0create mode 100644 recipes-kernel/linux/linux-<wbr>yocto_virtualizati=
on.inc<br>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend b/recipes-=
kernel/linux/linux-<wbr>yocto_4.10.bbappend<br>
index f163fdf..617cacc 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend<br>
@@ -1,20 +1 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
-<br>
-SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ebtables.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vswitch.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>scc&qu=
ot;<br>
-<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;openvswitch&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-amd&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-intel&quot;<br>
-<br>
-# aufs kernel support required for xen-image-minimal<br>
-KERNEL_FEATURES_append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FE=
ATURES&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;<wbr>,=
 &#39;&#39;, d)}&quot;<br>
-<br>
-# xen kernel support<br>
-SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
+require ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;virtuali=
zation&#39;, &#39;${BPN}_virtualization.inc&#39;, &#39;&#39;, d)}<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.12.bbappend b/recipes-=
kernel/linux/linux-<wbr>yocto_4.12.bbappend<br>
index f163fdf..617cacc 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.12.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.12.bbappend<br>
@@ -1,20 +1 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
-<br>
-SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ebtables.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vswitch.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>scc&qu=
ot;<br>
-<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;openvswitch&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-amd&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-intel&quot;<br>
-<br>
-# aufs kernel support required for xen-image-minimal<br>
-KERNEL_FEATURES_append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FE=
ATURES&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;<wbr>,=
 &#39;&#39;, d)}&quot;<br>
-<br>
-# xen kernel support<br>
-SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
+require ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;virtuali=
zation&#39;, &#39;${BPN}_virtualization.inc&#39;, &#39;&#39;, d)}<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend b/recipes-k=
ernel/linux/linux-<wbr>yocto_4.4.bbappend<br>
index f163fdf..617cacc 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend<br>
@@ -1,20 +1 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
-<br>
-SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ebtables.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vswitch.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>scc&qu=
ot;<br>
-<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;openvswitch&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-amd&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-intel&quot;<br>
-<br>
-# aufs kernel support required for xen-image-minimal<br>
-KERNEL_FEATURES_append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FE=
ATURES&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;<wbr>,=
 &#39;&#39;, d)}&quot;<br>
-<br>
-# xen kernel support<br>
-SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
+require ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;virtuali=
zation&#39;, &#39;${BPN}_virtualization.inc&#39;, &#39;&#39;, d)}<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend b/recipes-k=
ernel/linux/linux-<wbr>yocto_4.9.bbappend<br>
index f163fdf..617cacc 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend<br>
@@ -1,20 +1 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
-<br>
-SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ebtables.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vswitch.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>scc&qu=
ot;<br>
-<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;openvswitch&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-amd&quot;<br>
-KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-intel&quot;<br>
-<br>
-# aufs kernel support required for xen-image-minimal<br>
-KERNEL_FEATURES_append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FE=
ATURES&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;<wbr>,=
 &#39;&#39;, d)}&quot;<br>
-<br>
-# xen kernel support<br>
-SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
+require ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;virtuali=
zation&#39;, &#39;${BPN}_virtualization.inc&#39;, &#39;&#39;, d)}<br></bloc=
kquote><div><br></div><div>But now you&#39;ve just made up a random distro =
flag that no one uses and will</div><div>impact every existing build of met=
a-virtualization.</div><div><br></div><div>so no, I won&#39;t merge this ju=
st to fix a boot with a qemu machine. There must</div><div>be a better solu=
tion. i.e. make a flag opt-out of using the loads, and throw a</div><div>wa=
rning and we can transition to something like you have above over time.</di=
v><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_virtualization.inc b/rec=
ipes-kernel/linux/linux-<wbr>yocto_virtualization.inc<br>
new file mode 100644<br>
index 0000000..f163fdf<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_virtualization.inc<br>
@@ -0,0 +1,20 @@<br>
+FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
+<br>
+SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ebtables.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vswitch.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>scc&qu=
ot;<br>
+<br>
+KERNEL_MODULE_AUTOLOAD +=3D &quot;openvswitch&quot;<br>
+KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm&quot;<br>
+KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-amd&quot;<br>
+KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-intel&quot;<br>
+<br>
+# aufs kernel support required for xen-image-minimal<br>
+KERNEL_FEATURES_append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FE=
ATURES&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;<wbr>,=
 &#39;&#39;, d)}&quot;<br>
+<br>
+# xen kernel support<br>
+SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
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
</div></div>

--001a114d38ee9f47c00559c62264--
