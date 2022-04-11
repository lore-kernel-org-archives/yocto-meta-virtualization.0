Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BD8C54F46
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.28771.1649679313634993348
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 05:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VLOaTKn1;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id bv19so7420296ejb.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 05:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qp6ZNORT8GBg6W2KkZOGt9+Y/G5xI2rQPANLwBSpzpw=;
        b=VLOaTKn1yB/eh/pTAunyq43BqJQe/tVMZMNPitExAeMbq44sF6ovM9upw396tewdH9
         mcE1veRUdKaZ7dDJUL2YhP3F0bWaVmuU/k6dvM2bZEBvcwp/d9FeCPyCHkSmHcVdEQWf
         aYG+eoPMZ/+X0Gru6Vy8e0RU+JyDqdGXul8EMbKOvnrGfRXUUHSzWqKoAHhpoZDP8FVe
         MJVOFDXnznphxuvS8Y9FSJtghE/aytOQNSt84JC4oQopof63XG86s5MDId9KKWO3zarZ
         liEnM5DnWxDRW5xgP/my2p6mzzUBsbsnE3QI1O5zJtSwSUjxQcxhPJHvR0o2uOk2Kxtm
         iK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qp6ZNORT8GBg6W2KkZOGt9+Y/G5xI2rQPANLwBSpzpw=;
        b=CR9KxuTqBzTg/Ng9u0huivtVoSGTiIL6zey4oWX2iRZh0eRblbf4lERKt1fNO+EenH
         GL1tiqItm2IKU52qrZ6+upo8deLJGxAsPSQF5sao5+vVKc/ebWJZ81efpCCU5DJh/mxF
         2bUobEODfw2rfGsJxTLq3U1t9vEIMoIj8XZ15zc9rCpANkJ+k4kd9iprTVdZEeWK5Rbf
         rE6aBvOatBrPynmHn1/6mtJz4nO9hjQN7O1GzC3L8s0mbVI9y2VzEEv7OJhD/Rb6+yNf
         7T1d2ikMrvo/tXAKQj57rAS8lg9RtzVgPKj/lKmj35V3+3htii13GPS2Nv8xRgiq1rZU
         Ox+g==
X-Gm-Message-State: AOAM532PjBLjUkPCjvubsKh6q/P8KS6AwR8HstaQ9iCfe25tyXVHCqLG
	7CHjx5KD5SS/stYG96uztHXGOyQHtSZdzl4sI2o=
X-Google-Smtp-Source: 
 ABdhPJyBz0FSL10gEWxNyuAYRAMW+RZj21NIrJK00jyg88q+PuA29tzCNRuMKazQVCZHnLYhSj4JQmgcDx2zVgSeGhw=
X-Received: by 2002:a17:906:dc8f:b0:6e0:5ce7:d80e with SMTP id
 cs15-20020a170906dc8f00b006e05ce7d80emr30710820ejc.435.1649679312006; Mon, 11
 Apr 2022 05:15:12 -0700 (PDT)
MIME-Version: 1.0
References: 
 <d3d2905df2c1a8387caaec078700c1666a4df821.1649673869.git.diego.sueiro@arm.com>
In-Reply-To: 
 <d3d2905df2c1a8387caaec078700c1666a4df821.1649673869.git.diego.sueiro@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Apr 2022 08:15:01 -0400
Message-ID: 
 <CADkTA4P1H15nZ+S5o9WYbUor=waAQJVzBvHg74H+XitFUdsGVg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] cni: Add ;protocol=https for
 flannel_plugin SRC_URI
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="00000000000062b1a605dc5fe5f7"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7149

--00000000000062b1a605dc5fe5f7
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 11, 2022 at 6:45 AM Diego Sueiro <diego.sueiro@arm.com> wrote:

> Also, fix the indentation for the SRC_URI variable assignment.
>
>
It had a protocol specification already, I just managed to miss an 'o'.
I've fixed that, and pushed the change.

Annoying that github didn't break/stop my build immediately with that typo,
but at least it is fixed now

Bruce



> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-networking/cni/cni_git.bb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/
> cni_git.bb
> index 42eed1b..9248af2 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -15,10 +15,11 @@ SRCREV_plugins =
> "b8a10bbe111e9db72433f357c37077554ada7ca1"
>  SRCREV_flannel_plugin = "076c4462d6c6887614fc881b806b690b9e56ceb2"
>  SRCREV_FORMAT = "cni_plugins"
>  SRC_URI = "\
> -       git://
> github.com/containernetworking/cni.git;nobranch=1;name=cni;protocol=https
> \
> -        git://
> github.com/containernetworking/plugins.git;nobranch=1;destsuffix=${S}/src/github.com/containernetworking/plugins;name=plugins;protocol=https
> <http://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=$%7BS%7D/src/github.com/containernetworking/plugins;name=plugins;protocol=https>
> \
> -        git://
> github.com/flannel-io/cni-plugin;branch=main;name=flannel_plugin;protcol=https;destsuffix=${S}/src/github.com/containernetworking/plugins/plugins/meta/flannel
> <http://github.com/flannel-io/cni-plugin;branch=main;name=flannel_plugin;protcol=https;destsuffix=$%7BS%7D/src/github.com/containernetworking/plugins/plugins/meta/flannel>
> \
> -       "
> +    git://
> github.com/containernetworking/cni.git;nobranch=1;name=cni;protocol=https
> \
> +    git://
> github.com/containernetworking/plugins.git;nobranch=1;destsuffix=${S}/src/github.com/containernetworking/plugins;name=plugins;protocol=https
> <http://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=$%7BS%7D/src/github.com/containernetworking/plugins;name=plugins;protocol=https>
> \
> +    git://
> github.com/flannel-io/cni-plugin;branch=main;name=flannel_plugin;protcol=https;destsuffix=${S}/src/github.com/containernetworking/plugins/plugins/meta/flannel;protocol=https
> <http://github.com/flannel-io/cni-plugin;branch=main;name=flannel_plugin;protcol=https;destsuffix=$%7BS%7D/src/github.com/containernetworking/plugins/plugins/meta/flannel;protocol=https>
> \
> +    "
> +
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM =
> "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
>
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7148):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7148
> Mute This Topic: https://lists.yoctoproject.org/mt/90391972/1050810
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

--00000000000062b1a605dc5fe5f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 11, 2022 at 6:45 AM Diego Sueiro &lt;<a=
 href=3D"mailto:diego.sueiro@arm.com">diego.sueiro@arm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Also, fix the ind=
entation for the SRC_URI variable assignment.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">It had a protocol specification already, I just managed to=
 miss an &#39;o&#39;. I&#39;ve fixed that, and pushed the change.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Annoying that github didn&#39;t br=
eak/stop my build immediately with that typo, but at least it is fixed now<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Diego Sueiro &lt;<a href=3D"mailto:diego.sueiro@arm.com" tar=
get=3D"_blank">diego.sueiro@arm.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a> | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"no=
referrer" target=3D"_blank">cni_git.bb</a> b/recipes-networking/cni/<a href=
=3D"http://cni_git.bb" rel=3D"noreferrer" target=3D"_blank">cni_git.bb</a><=
br>
index 42eed1b..9248af2 100644<br>
--- a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
+++ b/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
@@ -15,10 +15,11 @@ SRCREV_plugins =3D &quot;b8a10bbe111e9db72433f357c37077=
554ada7ca1&quot;<br>
=C2=A0SRCREV_flannel_plugin =3D &quot;076c4462d6c6887614fc881b806b690b9e56c=
eb2&quot;<br>
=C2=A0SRCREV_FORMAT =3D &quot;cni_plugins&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/containernet=
working/cni.git;nobranch=3D1;name=3Dcni;protocol=3Dhttps" rel=3D"noreferrer=
" target=3D"_blank">github.com/containernetworking/cni.git;nobranch=3D1;nam=
e=3Dcni;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/containerne=
tworking/plugins.git;nobranch=3D1;destsuffix=3D$%7BS%7D/src/github.com/cont=
ainernetworking/plugins;name=3Dplugins;protocol=3Dhttps" rel=3D"noreferrer"=
 target=3D"_blank">github.com/containernetworking/plugins.git;nobranch=3D1;=
destsuffix=3D${S}/src/github.com/containernetworking/plugins;name=3Dplugins=
;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/flannel-io/=
cni-plugin;branch=3Dmain;name=3Dflannel_plugin;protcol=3Dhttps;destsuffix=
=3D$%7BS%7D/src/github.com/containernetworking/plugins/plugins/meta/flannel=
" rel=3D"noreferrer" target=3D"_blank">github.com/flannel-io/cni-plugin;bra=
nch=3Dmain;name=3Dflannel_plugin;protcol=3Dhttps;destsuffix=3D${S}/src/gith=
ub.com/containernetworking/plugins/plugins/meta/flannel</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/containernetworking/cni.g=
it;nobranch=3D1;name=3Dcni;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/containernetworking/cni.git;nobranch=3D1;name=3Dcni;proto=
col=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/containernetworking/plugi=
ns.git;nobranch=3D1;destsuffix=3D$%7BS%7D/src/github.com/containernetworkin=
g/plugins;name=3Dplugins;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/containernetworking/plugins.git;nobranch=3D1;destsuffix=3D$=
{S}/src/github.com/containernetworking/plugins;name=3Dplugins;protocol=3Dht=
tps</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/flannel-io/cni-plugin;bra=
nch=3Dmain;name=3Dflannel_plugin;protcol=3Dhttps;destsuffix=3D$%7BS%7D/src/=
github.com/containernetworking/plugins/plugins/meta/flannel;protocol=3Dhttp=
s" rel=3D"noreferrer" target=3D"_blank">github.com/flannel-io/cni-plugin;br=
anch=3Dmain;name=3Dflannel_plugin;protcol=3Dhttps;destsuffix=3D${S}/src/git=
hub.com/containernetworking/plugins/plugins/meta/flannel;protocol=3Dhttps</=
a> \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3Dfa818a259c=
bed7ce8bc2a22d35a464fc&quot;<br>
<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7148): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7148" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7148</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90391972/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90391972/1050810</a><br>
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

--00000000000062b1a605dc5fe5f7--

