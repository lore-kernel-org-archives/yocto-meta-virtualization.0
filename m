Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20960.1794802746429146363
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Nov 2026 20:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ns17zO4z;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so535066241.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Nov 2026 20:19:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794802745; cv=none;
        d=google.com; s=arc-20260327;
        b=rIT80Kvq0WD26+2LonqASSt3CIfnrFY2fXZ6bPhnKCpYle+UEtLkemsVFVx0NYNLF3
         0VWPdhYAjBE+yU1jNS3gP5t0Y/kdFOoQz3rFfaxhHBDdnlO6OwaUXg9i6iZaQsC2LBjc
         HXckkHLePac9/RLr1YLwDt3jdLxz3UkHe9nMIHQmEpQC+UdnyJ85yM3XDSNZp0PIQw8o
         5p9+QJq0icVbngqHguZmdj/662HH8sFffwUSGfGjNwOCnPjPzvOy8MfomDf0QFaLuMCs
         RB/INVwWLW9Uby5NREmDCaIgMdqHFvDnNpELe0yRtBLwGImFNbkT0xEfemmIpeTEcBr9
         2otA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=frcVBBooZIyQnzUN4t+iSUXj9DAJob5uYjB4KvotXdE=;
        fh=YKjR+7DXmIBw0z4BFJsBMe3JjIIUFxibOzP+v74cDzE=;
        b=es2AiHXzRBNoI9tKYwC9n8zvun5mWsdCcssS7Dom2D3WKpLEznJMdfa8/583khryNm
         Ossj/933ZDt7lDdyskZsNbob8fgSmaNBJTeomcKMqnroTNjDiKMqRzD4I2F48bdViKPB
         9nIxjkwF+rGdL7AoxUoYvR9GkUPcmUPnQVQYMQQDYtvbtelTl47WpdgtJfeOTl0dpE9k
         XyT4W6Xk7sB5nA8atLNqFsDQdFzq52FKv7t2Hvoaz7Zc1xj8uj5e2lZYJETB7dZsxSS8
         8NU+iUwskI6GhFFRDCBPQQpUUwazPfR/jLL4NAHthvhzgdTx96pqWWsulnp6anM0LtU1
         Vy/Q==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802745; x=1795407545; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frcVBBooZIyQnzUN4t+iSUXj9DAJob5uYjB4KvotXdE=;
        b=ns17zO4zSM7Af4GvjckYN6MX8wW6bWk5pf7TPdubqy3KepdCpBXyynRCd6lfP0+E5N
         ku0hXD6hU6d41Bnrm6egznNU8UO/p4FFYZ+S/N3pec5/J3N1XETO3rR2yliypJG8kG+D
         8GjpsekKesp2+tgBiRAVPdvTpe0vBN8QIRBgroJKVovXDxVY2323JzpJBbTjPEM78x/V
         904XQUc1ob7+VSkhINyAAT8xnN/P4mYauuRrCUicOn/sp3aJAWeTq0apK+qmDIXa04Pb
         1sa9jPqyF9RnU/GB4iJrk7FZUtesTH9UBDTBx4oFXm5SA3w54rs70MWtQc6AY6bVRsvv
         OjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802745; x=1795407545;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=frcVBBooZIyQnzUN4t+iSUXj9DAJob5uYjB4KvotXdE=;
        b=jVZ0qwwwD4jQnvzTejR0MMBjoyyir1nIV+gE2WuFlmyfslXA9m/vMKihohLwypDvqn
         UBTNhDSDmGom2zjA6U2saWasqLT3V9TFaaCu3JoNijP4JXkpVQDMzVQfafldKuELjjfF
         b/cYmTGRHS++p/nV4qYZVWXoGEDxwnyeV0/5vE25vGXlw/Sj6s4r0eKLomJ0/FBxZfPg
         qL4QsFYrLXAwrry1bFJgJdOlYK7BjT+72EUX74XIR9nsWazJI8DOOPOe7vqKtTGIjOwU
         XlAifYKUGSrrzwOcZG7+QPQjwBsxoAzp2lWawNW/nMUdgJZyP40derKtNKH68DRw6CM4
         hEyA==
X-Gm-Message-State: APuU4Z+DtNNx1IkUTHLY8/TC6GcqRG0hZSV0wxMr8NDuWS1v64+H3Iek
	IILd/u3aGb4GHas8v1LHPlGeYsDFAuyi58SMjflfxnjWo/IhzRsROxDDMrElzYyTkTOEGCRMsrI
	noQzGMP/5ZJcyZYe1vUm59lssYI0PgPc=
X-Gm-Gg: AYBFou2Bu1XkoROM581CX7RVH6JsFM3P17eC2HMY2AUfux5uCev9UBUnpjKBDJhKXbQ
	wa9iSFJylI3tJAH8l5NpUJnF6MDC8Aiw/0ciIKRIm7OzbD8hmYjHNfFA+gj7DZ/P672RFWtDepj
	A6B/lAGF/IMUXuzognhG673NBgIviPNsJrwNeG7Z8LFAuppOjpnquJGZxN2xwv6LVHFE7iE5+eR
	dLImSNamFO/1Y7oik6p/YugFek9wLhLVu0iIsFyn5zxGXTR8S/HYxOf4v9rNI+tEl9CdFXJg124
	dRjMqph2yTa+WTMFBCcV9DvCOXNYmooavyyDD4sXIiTiQlSypHz5NOjUEqDj/mCRK73RlhO3blI
	JQkTZnSOwf4qNBDDLZC2Nzm9W2ztNd1EZFaqxOTXQQ6YUsQBmwL7GDwU8KAUoNEEehkdIOtSTVC
	e6GyEhM20gqZqp85LLg1vE+viCHu9f8ngvcXLO/sIrUWLB5DAOph4AXg==
X-Received: by 2002:a05:6122:1d04:b0:5ec:b4ec:e93f with SMTP id
 71dfb90a1353d-5ee34a7da36mr2903610e0c.10.1794802744913; Sun, 15 Nov 2026
 20:19:04 -0800 (PST)
MIME-Version: 1.0
References: <20261112152510.1116302-1-JPEWhacker@gmail.com>
In-Reply-To: <20261112152510.1116302-1-JPEWhacker@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 15 Nov 2026 23:18:52 -0500
X-Gm-Features: Aa3M54pTgsUJlCUvKFgwnRnhUljjzptvrUJCFoAfaqx99qAiTHXV5ytLlbMnmI8
Message-ID: <CADkTA4NyDCVYtE+8F6p3Ehgpbmv9_r1ZKBwXEgd+1cE5EJs8uQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] Fix up SPDX deploy errors
To: JPEWhacker@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000d744d06605d144c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Nov 2026 04:19:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10168

--0000000000000d744d06605d144c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

applied to master-next.

Bruce

On Thu, Nov 12, 2026 at 10:25=E2=80=AFAM Joshua Watt via meta-virtualizatio=
n
<JPEWhacker=3Dgmail.com@lists.yoctoproject.org> wrote:

> do_deploy tasks now generate SPDX output for files that are placed in
> the deploy directory; however SPDX must be told if it is expected that
> do_deploy will not produce any files by setting
> SPDX_DEPLOY_ALLOW_EMPTY:task-deploy =3D "1"
>
> Several recipes in meta-virtualization have do_deploy tasks that may not
> produce any output, so mark these tasks to prevent them from generating
> errors.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  classes/container-bundle.bbclass   | 1 +
>  classes/oci-multiarch.bbclass      | 1 +
>  recipes-extended/xen/xen-tools.inc | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/classes/container-bundle.bbclass
> b/classes/container-bundle.bbclass
> index 25f1a1e2..7377f0fb 100644
> --- a/classes/container-bundle.bbclass
> +++ b/classes/container-bundle.bbclass
> @@ -637,3 +637,4 @@ do_deploy[dirs] =3D "${DEPLOYDIR}"
>
>  # Only add sstate for deploy when enabled
>  SSTATE_SKIP_CREATION:task-deploy =3D "${@'' if
> d.getVar('CONTAINER_BUNDLE_DEPLOY') =3D=3D '1' else '1'}"
> +SPDX_DEPLOY_ALLOW_EMPTY:task-deploy =3D "1"
> diff --git a/classes/oci-multiarch.bbclass b/classes/oci-multiarch.bbclas=
s
> index 43944afc..b92e13d8 100644
> --- a/classes/oci-multiarch.bbclass
> +++ b/classes/oci-multiarch.bbclass
> @@ -272,5 +272,6 @@ python do_deploy() {
>  }
>
>  addtask do_deploy after do_create_multiarch_index before do_build
> +SPDX_DEPLOY_ALLOW_EMPTY:task-deploy =3D "1"
>
>  EXCLUDE_FROM_WORLD =3D "1"
> diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> index f38cabc2..0e46f289 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -954,3 +954,4 @@ do_deploy() {
>  # - add the task before do_build to ensure that deployment has completed
> when
>  #   the recipe build done stamp is written
>  addtask deploy after do_install do_populate_sysroot before do_build
> +SPDX_DEPLOY_ALLOW_EMPTY:task-deploy =3D "1"
> --
> 2.56.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#10166):
> https://lists.yoctoproject.org/g/meta-virtualization/message/10166
> Mute This Topic: https://lists.yoctoproject.org/mt/122231710/1050810
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

--0000000000000d744d06605d144c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">app=
lied to master-next.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Nov 12, 2026 at 10:25=E2=80=AFAM Josh=
ua Watt via meta-virtualization &lt;JPEWhacker=3D<a href=3D"mailto:gmail.co=
m@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">do_deploy tasks n=
ow generate SPDX output for files that are placed in<br>
the deploy directory; however SPDX must be told if it is expected that<br>
do_deploy will not produce any files by setting<br>
SPDX_DEPLOY_ALLOW_EMPTY:task-deploy =3D &quot;1&quot;<br>
<br>
Several recipes in meta-virtualization have do_deploy tasks that may not<br=
>
produce any output, so mark these tasks to prevent them from generating<br>
errors.<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0classes/container-bundle.bbclass=C2=A0 =C2=A0| 1 +<br>
=C2=A0classes/oci-multiarch.bbclass=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0recipes-extended/xen/xen-tools.inc | 1 +<br>
=C2=A03 files changed, 3 insertions(+)<br>
<br>
diff --git a/classes/container-bundle.bbclass b/classes/container-bundle.bb=
class<br>
index 25f1a1e2..7377f0fb 100644<br>
--- a/classes/container-bundle.bbclass<br>
+++ b/classes/container-bundle.bbclass<br>
@@ -637,3 +637,4 @@ do_deploy[dirs] =3D &quot;${DEPLOYDIR}&quot;<br>
<br>
=C2=A0# Only add sstate for deploy when enabled<br>
=C2=A0SSTATE_SKIP_CREATION:task-deploy =3D &quot;${@&#39;&#39; if d.getVar(=
&#39;CONTAINER_BUNDLE_DEPLOY&#39;) =3D=3D &#39;1&#39; else &#39;1&#39;}&quo=
t;<br>
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy =3D &quot;1&quot;<br>
diff --git a/classes/oci-multiarch.bbclass b/classes/oci-multiarch.bbclass<=
br>
index 43944afc..b92e13d8 100644<br>
--- a/classes/oci-multiarch.bbclass<br>
+++ b/classes/oci-multiarch.bbclass<br>
@@ -272,5 +272,6 @@ python do_deploy() {<br>
=C2=A0}<br>
<br>
=C2=A0addtask do_deploy after do_create_multiarch_index before do_build<br>
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy =3D &quot;1&quot;<br>
<br>
=C2=A0EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc<br>
index f38cabc2..0e46f289 100644<br>
--- a/recipes-extended/xen/xen-tools.inc<br>
+++ b/recipes-extended/xen/xen-tools.inc<br>
@@ -954,3 +954,4 @@ do_deploy() {<br>
=C2=A0# - add the task before do_build to ensure that deployment has comple=
ted when<br>
=C2=A0#=C2=A0 =C2=A0the recipe build done stamp is written<br>
=C2=A0addtask deploy after do_install do_populate_sysroot before do_build<b=
r>
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy =3D &quot;1&quot;<br>
-- <br>
2.56.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#10166): <a href=3D"https://lists.yoctoproject.org/g/met=
a-virtualization/message/10166" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.yoctoproject.org/g/meta-virtualization/message/10166</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/122231710/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/122231710/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000000d744d06605d144c--
