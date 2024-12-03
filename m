Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC21E69EAF
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 15:47:45 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.23126.1733240864285137232
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 07:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QForpsJQ;
 spf=pass (domain: mvista.com, ip: 209.85.167.47, mailfrom: vanusuri@mvista.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so5702566e87.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Dec 2024 07:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1733240862; x=1733845662; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FxzodQEaBvsvoglr5Xmb9ObhNwEgfJjj+4kvo5qgCNo=;
        b=QForpsJQABsVdUANmgqMgm1JGGIWSxA+aB02wJmcdMlDEGy1aMYmbcj/BhzO14itmc
         m6czFxax4j3Uj+kCy6rOdL6HPDjnEdh84IA3uJTb1/5PUhBIetkTDmH/cQqA2G0Z5Vlx
         5Nvbg8qvsQkuEut+wNFYiLw9X2devXRybtWBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733240862; x=1733845662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxzodQEaBvsvoglr5Xmb9ObhNwEgfJjj+4kvo5qgCNo=;
        b=bP6K5zLce9/0EjLZAQzphdDcoc96I0E7zRXQL5Y2HZILYHsvx/RbJNHHmRUqwsxbj/
         04U6NTgRjNCe0A7lOrAZrXTPPdZye3Iunun6ENLYedPDXZsfdNYaLAkLet4xqFqN1uie
         gjZ4vHsxl4Ic0Tigoyle4C7K7kcbnQftuagmFbD7O1xErWPJKZt19OlP2ansYJTL0mx2
         kX3yIYHyaW6KZA0TZaepUWrT0RaerxAVIE1UMVdXUyrtINwLRR7iXfAJMu8nIugWblS9
         +FBP2Mw8PjTZxP4f47QEkWfKp0htaqAQbaBx8qiXzuWz9a1AKN9Y/mFBSloCpQLhBPHa
         S9lg==
X-Gm-Message-State: AOJu0YxfvuR5VxJmnk6tLl4RfvJP1y2dLSdwHYaoIKrmfymFB+5pbqAr
	s9jCynJNtMDzwH8A1yMrbeaxM/g9im3DDUxAK02pJCYnGpe76paPm8x6XxZjp9oI6bNsEM6t8Ti
	QPeSdqmVXBVy5Y7QTFfBNbY9TWm36CkDkaoLJ5A==
X-Gm-Gg: ASbGncvG+aL5MeP2SIrReg0fNrzFe/LQVoP5jM2FKoU/NM4jXPLsqU5MdFeiMk3yYae
	JcOtkfHtSyJDXFbW85lNp+res3wkzvwhw
X-Google-Smtp-Source: AGHT+IGXQbiHKEBRXQDawLdOm0vcxQqKYlnNe7psbjf4ABhKdQlNa2l54xSEbQ0HWuyIcBol5sJKirfXruhqHGAdCrc=
X-Received: by 2002:a05:6512:104f:b0:53d:6b50:f5f9 with SMTP id
 2adb3069b0e04-53e12a2173emr2000051e87.38.1733240862106; Tue, 03 Dec 2024
 07:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20241203124748.3731353-1-vanusuri@mvista.com> <CADkTA4P51-mVRXU3phWSucNc2A6YrodgOgcFZAg_CeR7G34YDw@mail.gmail.com>
In-Reply-To: <CADkTA4P51-mVRXU3phWSucNc2A6YrodgOgcFZAg_CeR7G34YDw@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 3 Dec 2024 21:17:30 +0530
Message-ID: <CANQUz1_KqHVgCsuP5NnHzvgYaWWHg7T_Nz0nyL3cKQQDoGJ5GQ@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][master][PATCH] libvirt: Add missing
 "_" to bbappend
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e58aec06285f959a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Dec 2024 15:47:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9037

--000000000000e58aec06285f959a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes.

I was facing the below error when I added openstack in distro features.

project/yocto_master/meta-cloud-services/meta-openstack/recipes-extended/li=
bvirt/libvirt%.bbappend:1:
Could not include required file libvirt%_openstack.inc
ERROR: Parsing halted due to errors, see error messages above

It looks like it matches
meta-openstack/recipes-extended/libvirt/libvirt_openstack.inc .

libvirt%.bbappend has been using ${BPN}_openstack.inc . Here it looks like
bitbake taking BPN as libvirt%, but BPN should be libvirt.

Thanks & Regards,
Vijay



On Tue, Dec 3, 2024 at 8:12=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com>
wrote:

> There's no difference to those bbappends in my experience.
>
> The % is not a glob, but a wildcard that says "match until the end of the
> recipe name".
>
> Is there some sort of other libvirt recipe that this is matching by
> mistake ?
>
> Bruce
>
> On Tue, Dec 3, 2024 at 7:48=E2=80=AFAM Vijay Anusuri via lists.yoctoproje=
ct.org
> <vanusuri=3Dmvista.com@lists.yoctoproject.org> wrote:
>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../libvirt/{libvirt%.bbappend =3D> libvirt_%.bbappend}             | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename meta-openstack/recipes-extended/libvirt/{libvirt%.bbappend =3D>
>> libvirt_%.bbappend} (100%)
>>
>> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt%.bbappend
>> b/meta-openstack/recipes-extended/libvirt/libvirt_%.bbappend
>> similarity index 100%
>> rename from meta-openstack/recipes-extended/libvirt/libvirt%.bbappend
>> rename to meta-openstack/recipes-extended/libvirt/libvirt_%.bbappend
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9035):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/9035
>> Mute This Topic: https://lists.yoctoproject.org/mt/109899092/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[
>> bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--000000000000e58aec06285f959a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes.<br><br></div>I was facing the below error when I=
 added openstack in distro features.<br><br>project/yocto_master/meta-cloud=
-services/meta-openstack/recipes-extended/libvirt/libvirt%.bbappend:1: Coul=
d not include required file libvirt%_openstack.inc<br>ERROR: Parsing halted=
 due to errors, see error messages above<br><div><br></div><div>It looks li=
ke it matches meta-openstack/recipes-extended/libvirt/libvirt_openstack.inc=
 .<br><br>libvirt%.bbappend has been using ${BPN}_openstack.inc . Here it l=
ooks like bitbake taking BPN as libvirt%, but BPN should be libvirt.<br></d=
iv><div><br></div><div>Thanks &amp; Regards,<br></div><div>Vijay<br></div><=
div><br></div><br></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 3, 2024 at 8:12=E2=80=
=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.=
ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div c=
lass=3D"gmail_default" style=3D"font-size:small">There&#39;s no difference =
to those bbappends in my experience.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">The % is not a glob, but a wildcard that says &quot;match until=
 the end of the recipe name&quot;.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Is there some sort of other libvirt recipe that this is matching=
 by mistake ?</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Dec 3, 2024 at 7:48=E2=80=AFAM Vijay Anusuri via <a href=3D"http://=
lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;va=
nusuri=3D<a href=3D"mailto:mvista.com@lists.yoctoproject.org" target=3D"_bl=
ank">mvista.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"ma=
ilto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../libvirt/{libvirt%.bbappend =3D&gt; libvirt_%.bbappend}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A01 file changed, 0 insertions(+), 0 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-extended/libvirt/{libvirt%.bbappend =3D=
&gt; libvirt_%.bbappend} (100%)<br>
<br>
diff --git a/meta-openstack/recipes-extended/libvirt/libvirt%.bbappend b/me=
ta-openstack/recipes-extended/libvirt/libvirt_%.bbappend<br>
similarity index 100%<br>
rename from meta-openstack/recipes-extended/libvirt/libvirt%.bbappend<br>
rename to meta-openstack/recipes-extended/libvirt/libvirt_%.bbappend<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9035): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9035" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9035</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109899092/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109899092/1050810</a><br>
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
rek II<br><br></div></div>
</div>
</blockquote></div>

--000000000000e58aec06285f959a--

