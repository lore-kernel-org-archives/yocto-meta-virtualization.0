Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B820CC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 14:36:45 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.6883.1667399799340738036
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Nov 2022 07:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SPdyddhG;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id d123so10424053iof.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Nov 2022 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9maJWvMxVKbzYiJ+X7OP6rVWOfmzTBpgx6Awn2Zv6Gw=;
        b=SPdyddhGn0knJDRAv3E7VwCspx4VTBr8i/H4wUMqbaMAoGy3/l2lMXK6elTAbjy1L3
         nGuaTIfO+zPj3w9qxk8Mlb7Tvbe83DfuBDPVOUaRAprtmqTiPC74gDIpsUCgfJ0QiocS
         7qUAW6dDEIA3tSwETscpMGrhLPoE9f8FbI0VV5XLgUVlgtk6Y/7ATk00VOT5/3DXIFT2
         vkkbYqrsT+kP8h6/iDTFRQ2+wlV22ItdRo5Nui7YuGH1pkjoamSldFWvl8ugYQo+3/xt
         uRzeiSFFL1yObldVIF7L6wpKILYmC+erQo5a0i38XYkS3vPPrX1MJK1S5bVDLPMw7gG/
         gQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9maJWvMxVKbzYiJ+X7OP6rVWOfmzTBpgx6Awn2Zv6Gw=;
        b=DHLcFESFInagQNaJHplccfaIL4VIKnxiHiS7zr8WpyMaCadtQGLZzcDXjhYhHSppkI
         Z2XtV0rPtdVufegGKQSPXZ714JPvbak7zXJMXRwUQBhJ4kKXwXEn+5Ee0+aUUP3jUDih
         2YZTqVEbJy9rWxrBl8fxSIOp7CCQbmUkqZjDRN+jXPEe0zyAxwDfqsWKBGzX68jz57h5
         5fUZJyJoQu34omNHT3xTfAgd7JRQs8Jq0YO3E32cnntWe4Cg2vEJXsCltUrz3SBxOSeu
         F7xkjr48yCOsJAHNDATz632tMqagV+5rAZeP86RwHB40TtghqZrMcizn+irr3kBDKVU4
         1qjA==
X-Gm-Message-State: ACrzQf0PDGvoh+qbZ5D1ugzcsVZUAccuxHDi3N978j9ObQYrCcPPhlXh
	EUG/K5BaD+tKCEWmPeX2A5YBD64BguDhvy+Sq4I=
X-Google-Smtp-Source: AMsMyM70HURmbVPIhwPWVygHBQ/OneL6cQLrOIY5ujLowbHypWyUB3AMl/vRdzADY0hMRH6gDiRAgueesewauWy2rRY=
X-Received: by 2002:a05:6638:140e:b0:375:17da:5c96 with SMTP id
 k14-20020a056638140e00b0037517da5c96mr16287903jad.178.1667399798548; Wed, 02
 Nov 2022 07:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221101163018.741907-1-f_l_k@t-online.de> <20221101163018.741907-2-f_l_k@t-online.de>
In-Reply-To: <20221101163018.741907-2-f_l_k@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 2 Nov 2022 10:36:27 -0400
Message-ID: <CADkTA4OVkfD2Ki6E7J7bgnLLJZCgjnL6xjCxfouToL3-HioxUg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCHv2 2/2] virt-viewer: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b0ef8e05ec7dc437"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Nov 2022 14:36:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7673

--000000000000b0ef8e05ec7dc437
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 1, 2022 at 12:31 PM Markus Volk <f_l_k@t-online.de> wrote:

> virt-viewer is a minimal tool for displaying the graphical console of a
> virtual machine.
> The console is accessed using the VNC or SPICE protocol. The guest can be
> referred to
> based on its name, ID, or UUID. If the guest is not already running, then
> the viewer can
> be told to wait until it starts before attempting to connect to the
> console. The viewer
> can connect directly to both local and remotely hosted machines ,
> optionally using SSL/TLS
> encryption.
>
> virt-viewer is the required client for the debian based proxmox ve. That's
> also the environ-
> ment for which it was tested at runtime (only on x86_64).
>
> I have successfully compiled it for x86_64, aarch64 and qemumips. Other
> platforms might work
> (as long as gobject-introspection is available), but are untested.
> Adding the vnc protocol would pull in a layer dependency on meta-gnome.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../virt-viewer/virt-viewer_11.0.bb           | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 recipes-extended/virt-viewer/virt-viewer_11.0.bb
>
> diff --git a/recipes-extended/virt-viewer/virt-viewer_11.0.bb
> b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
> new file mode 100644
> index 0000000..d71e558
> --- /dev/null
> +++ b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "Virtual Machine Viewer"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +
> +# for ovirt support librest-0.7 and libgovirt would be needed
> +DEPENDS = " \
> +       desktop-file-utils-native \
> +       glib-2.0 \
> +       gtk+3 \
>

gtk+3 was a concern about a new dependency, but I just double checked and
since it is part of the main meta-openembedded layer, it isn't a new
dependency.

Bruce



> +       libxml2 \
> +"
> +
> +SRC_URI = "git://
> gitlab.com/virt-viewer/virt-viewer.git;protocol=https;branch=master"
> +
> +SRCREV = "1e99e5e4f409da91638eb79067ec738994c28ef5"
> +PV = "11.0+git${SRCPV}"
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG ?= "libvirt spice vte"
> +
> +PACKAGECONFIG[libvirt] = "-Dlibvirt=enabled,-Dlibvirt=disabled,libvirt
> libvirt-glib"
> +PACKAGECONFIG[spice] = "-Dspice=enabled,-Dspice=disabled,spice-gtk
> spice-protocol"
> +PACKAGECONFIG[vnc] = "-Dvnc=enabled,-Dvnc=disabled,gtk-vnc"
> +PACKAGECONFIG[vte] = "-Dvte=enabled,-Dvte=disabled,vte"
> +
> +inherit meson pkgconfig gtk-icon-cache mime mime-xdg gobject-introspection
> +
> +FILES:${PN} += "${datadir}"
> +GIR_MESON_OPTION = ''
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7672):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7672
> Mute This Topic: https://lists.yoctoproject.org/mt/94714508/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b0ef8e05ec7dc437
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 1, 2022 at 12:31 PM Markus Volk &lt;<a =
href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">virt-viewer is a minimal=
 tool for displaying the graphical console of a virtual machine.<br>
The console is accessed using the VNC or SPICE protocol. The guest can be r=
eferred to<br>
based on its name, ID, or UUID. If the guest is not already running, then t=
he viewer can<br>
be told to wait until it starts before attempting to connect to the console=
. The viewer<br>
can connect directly to both local and remotely hosted machines , optionall=
y using SSL/TLS<br>
encryption.<br>
<br>
virt-viewer is the required client for the debian based proxmox ve. That&#3=
9;s also the environ-<br>
ment for which it was tested at runtime (only on x86_64).<br>
<br>
I have successfully compiled it for x86_64, aarch64 and qemumips. Other pla=
tforms might work<br>
(as long as gobject-introspection is available), but are untested.<br>
Adding the vnc protocol would pull in a layer dependency on meta-gnome.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../virt-viewer/<a href=3D"http://virt-viewer_11.0.bb" rel=3D"norefer=
rer" target=3D"_blank">virt-viewer_11.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 29 +++++++++++++++++++<br>
=C2=A01 file changed, 29 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/virt-viewer/<a href=3D"http://vir=
t-viewer_11.0.bb" rel=3D"noreferrer" target=3D"_blank">virt-viewer_11.0.bb<=
/a><br>
<br>
diff --git a/recipes-extended/virt-viewer/<a href=3D"http://virt-viewer_11.=
0.bb" rel=3D"noreferrer" target=3D"_blank">virt-viewer_11.0.bb</a> b/recipe=
s-extended/virt-viewer/<a href=3D"http://virt-viewer_11.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">virt-viewer_11.0.bb</a><br>
new file mode 100644<br>
index 0000000..d71e558<br>
--- /dev/null<br>
+++ b/recipes-extended/virt-viewer/<a href=3D"http://virt-viewer_11.0.bb" r=
el=3D"noreferrer" target=3D"_blank">virt-viewer_11.0.bb</a><br>
@@ -0,0 +1,29 @@<br>
+SUMMARY =3D &quot;Virtual Machine Viewer&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59530bdf33659b29e73d4adb9f=
9f6552&quot;<br>
+<br>
+# for ovirt support librest-0.7 and libgovirt would be needed<br>
+DEPENDS =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0desktop-file-utils-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0glib-2.0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk+3 \<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">gtk+3 was a concern abo=
ut a new dependency, but I just double checked and since it is part of the =
main meta-openembedded layer, it isn&#39;t a new dependency.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libxml2 \<br>
+&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/virt-viewer/virt-view=
er.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blan=
k">gitlab.com/virt-viewer/virt-viewer.git;protocol=3Dhttps;branch=3Dmaster<=
/a>&quot;<br>
+<br>
+SRCREV =3D &quot;1e99e5e4f409da91638eb79067ec738994c28ef5&quot;<br>
+PV =3D &quot;11.0+git${SRCPV}&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+PACKAGECONFIG ?=3D &quot;libvirt spice vte&quot;<br>
+<br>
+PACKAGECONFIG[libvirt] =3D &quot;-Dlibvirt=3Denabled,-Dlibvirt=3Ddisabled,=
libvirt libvirt-glib&quot;<br>
+PACKAGECONFIG[spice] =3D &quot;-Dspice=3Denabled,-Dspice=3Ddisabled,spice-=
gtk spice-protocol&quot;<br>
+PACKAGECONFIG[vnc] =3D &quot;-Dvnc=3Denabled,-Dvnc=3Ddisabled,gtk-vnc&quot=
;<br>
+PACKAGECONFIG[vte] =3D &quot;-Dvte=3Denabled,-Dvte=3Ddisabled,vte&quot;<br=
>
+<br>
+inherit meson pkgconfig gtk-icon-cache mime mime-xdg gobject-introspection=
<br>
+<br>
+FILES:${PN} +=3D &quot;${datadir}&quot;<br>
+GIR_MESON_OPTION =3D &#39;&#39;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7672): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7672" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7672</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/94714508/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/94714508/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000b0ef8e05ec7dc437--

