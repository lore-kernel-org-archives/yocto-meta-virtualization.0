Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6400ECDB486
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:23:03 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.18309.1697131381087953237
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 10:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q16zJhPT;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-351437112c1so4486995ab.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697131380; x=1697736180; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HgaNFN80ice4TIMiz3QWHt+cTd9Pf/4iYwd+K0mmT6o=;
        b=Q16zJhPTG261QCgRb/JDAgdPJWzqMcKQnUMBEJsq2rZi+zNszeme/PSWyvZSFitG8S
         J0egVZd5tKmUSCiIOT+D8w6I1P5o/HuHOjrrZapazVyfWa3BVbc4vneSGflwxouNcmPT
         M2xa1WbgAdI/vbIw1dKHIPMByeo8TSa6e6nt1AYMWweailZjJHZ+dH1XB+P0UXll0b26
         n+wZC6Wwtop/CKvEu9XbeTHQlsRytqBuDZNC9PoNy/fEVmQWs2DSVFYD/aZOuHfcgRDi
         s9XrESE0V0BU3L+c98+L1dIwTk1UI4CIBrfO7l3u2sIlqjzT86a6/3mMBQpDEksG/dKz
         M9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697131380; x=1697736180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgaNFN80ice4TIMiz3QWHt+cTd9Pf/4iYwd+K0mmT6o=;
        b=vuRoIhKx8BZGC0QUlC8kRh5PdBg+wzteA3GMKgmX9rlCllJmd/UQx/f/+ogc6WXbaj
         qVJKv3GRUIPw4B3+NlUaAxCsZb2sDRuiUH4MEPpLu5C8uCGw7G5xGljAKb0MqDIXdYMk
         g2tqixYHOXaON5OUMctIyHebwNaVBdAzObyngjEoMAHCnkNnviLvdhVZucuLlvHS4j8L
         aO445NoMn06c9jayutVAidJzQuGS0Q/0/6vRytwuqWEdXe+WriI0ATi8/walBHsmk98g
         i2ywuFknPrWUdDeeziLwfvUl+7cS2Rcwq50PhZiHdoW/KeZrssv09TVRl2GXlnDrY82v
         B6+A==
X-Gm-Message-State: AOJu0YwTTL+/gSbzOeaVgVMNlkNyf8+dH9C0quijxX7nFnSK721kTBaq
	SvoihrfrVXnnOP36OoQe80MryiHxr4bPNg4dHVo=
X-Google-Smtp-Source: AGHT+IH7pdRjs5imaDNLzQ4X2Lz4r/pH+hLnqF5zumS7/5qe3ewJmPmLxsXDwh7nbRzcS/uj6vrSotglLqJx2pFRDYA=
X-Received: by 2002:a05:6e02:c62:b0:34f:1e9c:45d5 with SMTP id
 f2-20020a056e020c6200b0034f1e9c45d5mr20215740ilj.32.1697131380249; Thu, 12
 Oct 2023 10:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231012165156.357269-1-JPEWhacker@gmail.com>
In-Reply-To: <20231012165156.357269-1-JPEWhacker@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Oct 2023 13:22:48 -0400
Message-ID: <CADkTA4O+yo+mem+8GE1oWGjwwndWan6ojg+TF0_2UgZ9Ryuvyg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci: Add OCI_IMAGE_ENTRYPOINT_ARG_LIST
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000e9ce60607883144"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 17:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8354

--0000000000000e9ce60607883144
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 12:52=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.com>=
 wrote:

> The "entrypoint arguments" (command) is allowed to be a list of
> arguments to pass to the entrypoint. However, the current
> OCI_IMAGE_ENTRYPOINT_ARGS variables doesn't support however. In order to
> maintain backward compatibility, a new variable has to be introduced to
> that can be split into the multiple arguments required
>
>
I haven't looked in detail, but the original intent of that variable IS to
have more than
one argument. I was just the only current user of them, and only had one
argument
that needed to be passed.

I'd rather not have a new variable, but just change the processing to do 1
or more
arguments in the existing variable.

I'll also have to figure out how to make the sloci backend work, but that's
a different
question.

Bruce



> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  classes/image-oci-umoci.inc | 3 +++
>  classes/image-oci.bbclass   | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index 6c7f244..da93570 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -103,6 +103,9 @@ IMAGE_CMD:oci() {
>      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
>         umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd
> "${OCI_IMAGE_ENTRYPOINT_ARGS}"
>      fi
> +    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARG_LIST}" ]; then
> +       umoci config --image $image_name:${OCI_IMAGE_TAG} ${@"
> ".join("--config.cmd %s" % s for s in
> d.getVar("OCI_IMAGE_ENTRYPOINT_ARG_LIST").split())}
> +    fi
>      umoci config --image $image_name:${OCI_IMAGE_TAG} --author
> ${OCI_IMAGE_AUTHOR_EMAIL}
>
>      # make a tar version of the image direcotry
> diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
> index 9ddb88b..68045ad 100644
> --- a/classes/image-oci.bbclass
> +++ b/classes/image-oci.bbclass
> @@ -57,6 +57,7 @@ OCI_IMAGE_SUBARCH ?=3D
> "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.getVar('TUNE
>
>  OCI_IMAGE_ENTRYPOINT ?=3D "sh"
>  OCI_IMAGE_ENTRYPOINT_ARGS ?=3D ""
> +OCI_IMAGE_ENTRYPOINT_ARG_LIST ?=3D""
>  OCI_IMAGE_WORKINGDIR ?=3D ""
>  OCI_IMAGE_STOPSIGNAL ?=3D ""
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8353):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8353
> Mute This Topic: https://lists.yoctoproject.org/mt/101922305/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000e9ce60607883144
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 12, 2023 at 12:52=E2=80=AFPM Joshua Wat=
t &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The &quot;entrypoint arguments&quot; (command) is allowed to be =
a list of<br>
arguments to pass to the entrypoint. However, the current<br>
OCI_IMAGE_ENTRYPOINT_ARGS variables doesn&#39;t support however. In order t=
o<br>
maintain backward compatibility, a new variable has to be introduced to<br>
that can be split into the multiple arguments required<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I haven&#39;t looked in detail, but the original intent of=
 that variable IS to have more than</div><div class=3D"gmail_default" style=
=3D"font-size:small">one argument. I was just the only current user of them=
, and only had one argument</div><div class=3D"gmail_default" style=3D"font=
-size:small">that needed to be passed.</div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">I&#39;d rather=C2=A0not have a new v=
ariable, but just change the processing to do 1 or more</div><div class=3D"=
gmail_default" style=3D"font-size:small">arguments in the existing variable=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">I&#39;ll also have to f=
igure out how to make the sloci backend work, but that&#39;s a different</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">question.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0classes/image-oci-umoci.inc | 3 +++<br>
=C2=A0classes/image-oci.bbclass=C2=A0 =C2=A0| 1 +<br>
=C2=A02 files changed, 4 insertions(+)<br>
<br>
diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc<br>
index 6c7f244..da93570 100644<br>
--- a/classes/image-oci-umoci.inc<br>
+++ b/classes/image-oci-umoci.inc<br>
@@ -103,6 +103,9 @@ IMAGE_CMD:oci() {<br>
=C2=A0 =C2=A0 =C2=A0if [ -n &quot;${OCI_IMAGE_ENTRYPOINT_ARGS}&quot; ]; the=
n<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 umoci config --image $image_name:${OCI_IMAGE_TA=
G} --config.cmd &quot;${OCI_IMAGE_ENTRYPOINT_ARGS}&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 if [ -n &quot;${OCI_IMAGE_ENTRYPOINT_ARG_LIST}&quot; ]; then=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0umoci config --image $image_name:${OCI_IMAGE_TA=
G} ${@&quot; &quot;.join(&quot;--config.cmd %s&quot; % s for s in d.getVar(=
&quot;OCI_IMAGE_ENTRYPOINT_ARG_LIST&quot;).split())}<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0umoci config --image $image_name:${OCI_IMAGE_TAG} --aut=
hor ${OCI_IMAGE_AUTHOR_EMAIL}<br>
<br>
=C2=A0 =C2=A0 =C2=A0# make a tar version of the image direcotry<br>
diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass<br>
index 9ddb88b..68045ad 100644<br>
--- a/classes/image-oci.bbclass<br>
+++ b/classes/image-oci.bbclass<br>
@@ -57,6 +57,7 @@ OCI_IMAGE_SUBARCH ?=3D &quot;${@oci_map_subarch(d.getVar(=
&#39;TARGET_ARCH&#39;), d.getVar(&#39;TUNE<br>
<br>
=C2=A0OCI_IMAGE_ENTRYPOINT ?=3D &quot;sh&quot;<br>
=C2=A0OCI_IMAGE_ENTRYPOINT_ARGS ?=3D &quot;&quot;<br>
+OCI_IMAGE_ENTRYPOINT_ARG_LIST ?=3D&quot;&quot;<br>
=C2=A0OCI_IMAGE_WORKINGDIR ?=3D &quot;&quot;<br>
=C2=A0OCI_IMAGE_STOPSIGNAL ?=3D &quot;&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8353): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8353" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8353</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101922305/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101922305/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000000e9ce60607883144--

