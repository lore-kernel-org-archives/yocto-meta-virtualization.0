Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D81FC6FD18
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 03:17:29 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.16820.1680146247631078434
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 20:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P7EYJqPD;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id k17so7756525iob.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 20:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680146246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UginX3cFF29mdgBhvJiXkDkEiRBZDYpRQqqbH61u3AU=;
        b=P7EYJqPD1TkAM75G+bnMATDE2TTHLdpS15/MsjASIyQav1KQMClF2KnEiz5/vhyjPP
         Jj2dWKBQ2a1lWIw+uzPyAL1pDTk4DJvyavzdYCLylU7bwmjzUPEiNJJLaOFLCZMItXaI
         Q/iwCZVDj6zPlvcC7KGbx2LY38J/MAc4/+gJtvGGg9WXa+90jfq188pp9xgP/YZOLN1G
         6s4ZueYrx5YQffSqauRJtlp3APnvnQcbci1OC573/IlyiLjRDz7IypvTNXHf6unYJVy0
         Xd/5/6tgZKREAi3iQF+gu1gKIJHSJUpe1ibwQCroUh3DbNCpofYv3fYd+1bwmk268JDj
         94xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680146246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UginX3cFF29mdgBhvJiXkDkEiRBZDYpRQqqbH61u3AU=;
        b=lQUaCU4PV0mxpaf94SH5HeciyWG67J/4/LWJcdgb/2WjRmYSdqhhQonmRGPF85HQy4
         jhH9GBhj0ONb8mF6Z84ppByeR2RwHK0V9OlEBkD4nI/6j2r6amDv/h4bOT+OpyDcSGM1
         BxBeRfcXABKVAEoePmHOTsyFxAj7h5CQ7FR/8nIR+LsNP3GKtOdO8UvDvm2PTvR2558l
         XWe9AFb31BBGLrZEqtVZplTk70mxzDM1yg8iDSB1K6DyWoAIhGkrYeCltAFKrtlaM6Ly
         VnOQgj5vCfxOOZFRUW6k1vwJQI7/kbHvAdA6cIlM7rOdTlE/SaIYm5tWdwJ6VYuqawVz
         3MXg==
X-Gm-Message-State: AO0yUKV/Twn2XihL9lZRA7XG2oZM6w7HHdH/FrfE4raoSXwGNLaxn7Wo
	gJmKvJjjHtMSX0CpjOqyU6aPlNJ+293TkSFyR60fNGbBelU=
X-Google-Smtp-Source: AK7set+iLZf7yPDrdmoGHZUO0S5iILlnwdIsFkjrKf3+8NUOLSZGWCPFRrbWWWyDMvQD3fAlUt5CoIC+ngJ3voe99V4=
X-Received: by 2002:a02:8547:0:b0:3c2:b9ba:72f9 with SMTP id
 g65-20020a028547000000b003c2b9ba72f9mr8983932jai.5.1680146246681; Wed, 29 Mar
 2023 20:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230329215729.719615-1-sakib.sajal@windriver.com>
In-Reply-To: <20230329215729.719615-1-sakib.sajal@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 Mar 2023 23:17:14 -0400
Message-ID: <CADkTA4MwijK7T5iX3Xz-5Nm1eoUCvfmgwmjZy90cX9dEKRGCiw@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH] kubernetes: update to v1.23.17
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000344ac105f8158882"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 03:17:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7970

--000000000000344ac105f8158882
Content-Type: text/plain; charset="UTF-8"

Please do list them in the log. Simply listing the number isn't useful.

We aren't charged by the byte of text  ;)

Bruce

On Wed, Mar 29, 2023, 5:59 PM <sakib.sajal@windriver.com> wrote:

> Bumping kubernetes to version v1.23.17, which comprises of 251 commits,
> so not listing them in the log:
>   $ git log --no-merges --oneline fbcfa330..953be892 | wc -l
>     251
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> index 170a938..f475bd7 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -5,8 +5,8 @@ applications across multiple hosts, providing basic
> mechanisms for deployment, \
>  maintenance, and scaling of applications. \
>  "
>
> -PV = "v1.23.6+git${SRCREV_kubernetes}"
> -SRCREV_kubernetes = "fbcfa33018159c033aee77b0d5456df6771aa9b5"
> +PV = "v1.23.17+git${SRCREV_kubernetes}"
> +SRCREV_kubernetes = "953be8927218ec8067e1af2641e540238ffd7576"
>  SRCREV_kubernetes-release = "7c1aa83dac555de6f05500911467b70aca4949f0"
>  PE = "1"
>
> --
> 2.40.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7966):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7966
> Mute This Topic: https://lists.yoctoproject.org/mt/97939317/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000344ac105f8158882
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Please do list them in the log. Simply listing the n=
umber isn&#39;t useful.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
We aren&#39;t charged by the byte of text=C2=A0 ;)</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Bruce=C2=A0<br><br><div class=3D"gmail_quote" di=
r=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 29, 2023, 5:59=
 PM  &lt;<a href=3D"mailto:sakib.sajal@windriver.com">sakib.sajal@windriver=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Bumping kuberne=
tes to version v1.23.17, which comprises of 251 commits,<br>
so not listing them in the log:<br>
=C2=A0 $ git log --no-merges --oneline fbcfa330..953be892 | wc -l<br>
=C2=A0 =C2=A0 251<br>
<br>
Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com"=
 target=3D"_blank" rel=3D"noreferrer">sakib.sajal@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">kubernetes_git.bb</a> | 4 ++-=
-<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">kubernetes_git.bb</a> =
b/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
index 170a938..f475bd7 100644<br>
--- a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
+++ b/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
@@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechani=
sms for deployment, \<br>
=C2=A0maintenance, and scaling of applications. \<br>
=C2=A0&quot;<br>
<br>
-PV =3D &quot;v1.23.6+git${SRCREV_kubernetes}&quot;<br>
-SRCREV_kubernetes =3D &quot;fbcfa33018159c033aee77b0d5456df6771aa9b5&quot;=
<br>
+PV =3D &quot;v1.23.17+git${SRCREV_kubernetes}&quot;<br>
+SRCREV_kubernetes =3D &quot;953be8927218ec8067e1af2641e540238ffd7576&quot;=
<br>
=C2=A0SRCREV_kubernetes-release =3D &quot;7c1aa83dac555de6f05500911467b70ac=
a4949f0&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7966): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7966" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/message/7966</a><br=
>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97939317/1050=
810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopro=
ject.org/mt/97939317/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank" rel=3D"noreferrer">meta-virtualization+owner@list=
s.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000344ac105f8158882--

