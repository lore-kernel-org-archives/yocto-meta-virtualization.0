Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866A0FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 15:59:52 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web08.11034.1667231986188585067
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Oct 2022 08:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RVXeMVi3;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id r81so1406491iod.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Oct 2022 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=avK909HH2n2VV8Kc+Q/0oOtYObaotFoxJpHtjCHk2zY=;
        b=RVXeMVi3ebEEXK1UvYT96vxULnYX9PzHJhkvYLOfociNgB84YfbaY9lXYFic/+I4xG
         2qTb+J+/HWTHIyKyYsz84boY6KkP5MqWb3sjC0sYOnGMQ5LY0B2fNu7icfbhp1fbIA6g
         8mOHardC2oMZb9//RDbqc8scfkH3T0zrOEE3DsI8zEGk9hAeNBy2Q+E9NRYChnqlCg5x
         GV5X+mlr40UjB8iQ/6n4sxywUNrjpmRufP/8VgKxp+FGtyVAZKr+Ih3ZGCxlXgKpUM3i
         YepbEy8Hab8huRuCEgjQd+MezjC4v8QDy86iW6jvZi3kKySh9y3TwbPSlus45P9RITf9
         UbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avK909HH2n2VV8Kc+Q/0oOtYObaotFoxJpHtjCHk2zY=;
        b=Gk5bE8PmvsRBjEccARVP+Wd7iciqpFBfZyDZqdm1rmVoC+05oF9FcQ63N4Rvqu2+9L
         WfQw1AX4JFjsN1pxM28uPal2wMlV+lCOJe7InJ9TOMo5EXzujy7yQhB0kemb6GwHIMFs
         33bbOHE1fC6eFuXIvCw+ziR0bihJGyNOM3bdW7DRcshORaOeDGBqKBILaGJRYrLoGU56
         Ufvw65qdL44DIuX+hsaLfXiy7eEzqqmz/if0WS8kZj60U/pXos1ci3ke+83C1wuL0B4V
         Dagv+Vk1zC4Pi57QgatprXWYmd9hPvZfhM/a0LeWJWvtjnDUbQAx9zkUBS9JtYEmKzbX
         ilKA==
X-Gm-Message-State: ACrzQf3rfxbyRktujGq66FFxUg+RBkINPF6K+PxaKfHCUzdnOpKj9S0z
	YNqYv6sKXP+gWa5QgPjHBBf1iKdghJrgJFPfw2Y=
X-Google-Smtp-Source: AMsMyM65bSxqgRHwirWo0BDipypFb17TF/xdJ5K8wgU2dhSWskYFpGzeFmLzSL4VeR95h7z6sL4qNKkEqVovlQIkkvM=
X-Received: by 2002:a02:c9c1:0:b0:375:631a:92a6 with SMTP id
 c1-20020a02c9c1000000b00375631a92a6mr1843639jap.9.1667231985425; Mon, 31 Oct
 2022 08:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221030161333.12430-1-f_l_k@t-online.de>
In-Reply-To: <20221030161333.12430-1-f_l_k@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 31 Oct 2022 11:59:34 -0400
Message-ID: <CADkTA4ME2VJ8DUZQZnAMkydm7=u_EHvsb_1oPESyM537gqRN_g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] libvirt-glib: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003fe28505ec56b2df"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Oct 2022 15:59:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7668

--0000000000003fe28505ec56b2df
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

Thanks for the contribution. I have a few questions on each patch, so I'll
reply separately.

As part of this introduction, we need a commit message that indicates how
this was tested, which architectures, etc.  Is it a build dependency ? is
it linked and used on target, etc.

An overview of the application and the use case as well. I suspect this is
driven by the 2nd patch, but we should do the documentation of this
supporting package regardless.

Bruce

On Sun, Oct 30, 2022 at 12:13 PM Markus Volk <f_l_k@t-online.de> wrote:

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  recipes-extended/libvirt/libvirt-glib_4.0.0.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt-glib_4.0.0.bb
>
> diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> new file mode 100644
> index 0000000..11ad84a
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "A toolkit to interact with the virtualization capabilities
> of recent versions of Linux."
> +HOMEPAGE = "http://libvirt.org"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = "glib-2.0 libvirt libxml2"
> +
> +SRC_URI = "git://
> gitlab.com/libvirt/libvirt-glib;protocol=https;branch=master"
> +
> +SRCREV = "940bd9ccbfe419573ddec4383e3def4aac1f0e1f"
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig gobject-introspection vala
> +GIR_MESON_OPTION = ''
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7667):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7667
> Mute This Topic: https://lists.yoctoproject.org/mt/94667264/1050810
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

--0000000000003fe28505ec56b2df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Markus,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Thanks for the contribution. I have a few questions on each patch, so I&#39=
;ll reply separately.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">As =
part of this introduction, we need a commit message that indicates how this=
 was tested, which architectures, etc.=C2=A0 Is it a build dependency ? is =
it linked and used on target, etc.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">An overview of the application and the use case as well. I suspe=
ct=C2=A0this is driven by the 2nd patch, but we should do the documentation=
 of this supporting package=C2=A0regardless.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 30, 2022 at 12:13 PM Markus Vol=
k &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: =
Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_=
k@t-online.de</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt-glib_4.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt-glib_4.0.0.bb</a> | 14 ++++++++++=
++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/libvirt/<a href=3D"http://libvirt=
-glib_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">libvirt-glib_4.0.0.bb<=
/a><br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt-glib_4.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libvirt-glib_4.0.0.bb</a> b/recipe=
s-extended/libvirt/<a href=3D"http://libvirt-glib_4.0.0.bb" rel=3D"noreferr=
er" target=3D"_blank">libvirt-glib_4.0.0.bb</a><br>
new file mode 100644<br>
index 0000000..11ad84a<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt-glib_4.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt-glib_4.0.0.bb</a><br>
@@ -0,0 +1,14 @@<br>
+DESCRIPTION =3D &quot;A toolkit to interact with the virtualization capabi=
lities of recent versions of Linux.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://libvirt.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://libvirt.org</a>&quot;<br>
+LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c&quot;<br>
+<br>
+DEPENDS =3D &quot;glib-2.0 libvirt libxml2&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/libvirt/libvirt-glib;=
protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">gitl=
ab.com/libvirt/libvirt-glib;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
+<br>
+SRCREV =3D &quot;940bd9ccbfe419573ddec4383e3def4aac1f0e1f&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit meson pkgconfig gobject-introspection vala<br>
+GIR_MESON_OPTION =3D &#39;&#39;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7667): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7667" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7667</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/94667264/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/94667264/1050810</a><br>
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

--0000000000003fe28505ec56b2df--

