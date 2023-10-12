Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEAFCDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:25:23 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.18437.1697131518084602065
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 10:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V8704mMO;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7a5d26511f7so36304939f.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697131517; x=1697736317; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ8OSFIrcHv7R79jtm3byHy01oIVQw0eAv5bkvxhg9U=;
        b=V8704mMOHQ5o32810BvtX+2Yw6sZhAwiEsQvkAhu/lSHDoDKCTpIlykh40dZqaE8N4
         g0jHoKAKwiunUwp9GnmISDG9wUeBFmkDr6q8JUdJ6dn66Oh6LI8OAcJmcnGkbxqCj9XM
         OVpTAXV4eLI9rFjTsUZm2OCj1ZCsOyD8GDU9gCqCUeHnaY4uOwfvs6IYmgEVzBRSiKYy
         j7PuoHY9Vxl0jz4F0Q4L4LEYBu20hyAHP72ff1RbwH+5R6w8G/+aj+5X66lzCvonDCwB
         qjo/ZGjulqkhcfOPh0Cu/zespobv7j+UhUAYYSxOSaEMH7ChtldSfjwFJ7HO1bIKyzap
         +Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697131517; x=1697736317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQ8OSFIrcHv7R79jtm3byHy01oIVQw0eAv5bkvxhg9U=;
        b=jewaS3JfmbZOUyWb4TOGosHvAI11PG8CoXC3UWHqrMmn50odNahbHwpb3TeOUuxqGP
         Pgdxd9ZIpElI+uTxHz/Q2ARbmb4HUFXUMmjzUl8EdHUeXr7ucGNBp2fwbO3r+4MPurD+
         r4I+q5KNruPrwGuRsUQqrCR4NUA1B0VOfZEc3Fcmd93Q1laaar7ONdsKXIrGLB7kpZMn
         OZ0M+F1ZyB57JTjGsSNEGoNFd07IPVzE5HVBlSa236W3v9NRexzMEqKMWfVLuILUqHht
         K/MSiIwzG64LsJDFpfzks3l1NmSoJcXeovjOWPoPYf+Q4x3udLww72Cpu8pY4J7PFwV9
         uQVw==
X-Gm-Message-State: AOJu0YxtZo41AvTphVMVmCBQ/Oi9axfCP04xFK/nzb312U9sKcMN+Ati
	E8Ulel5NucNEltwvSrOc/dXIOKr1t2ePlwU1stU=
X-Google-Smtp-Source: AGHT+IED5jPyu0VQxa8ed3j6AVBVWQ5em+L46RdQnsltbWkz2yNC7atsHMeVXBJXdTRrWmxwgs3eag+dwqkXDar6ODQ=
X-Received: by 2002:a5d:9903:0:b0:79a:b667:4e97 with SMTP id
 x3-20020a5d9903000000b0079ab6674e97mr27184001iol.0.1697131517243; Thu, 12 Oct
 2023 10:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231012165156.357269-1-JPEWhacker@gmail.com> <178D6BFFDDF3349D.29357@lists.yoctoproject.org>
In-Reply-To: <178D6BFFDDF3349D.29357@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Oct 2023 13:25:06 -0400
Message-ID: <CADkTA4PAnZabpi8Hz-maV6fb9Mm0VnucUrHiX+42K5dkaYbQWw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci: Add OCI_IMAGE_ENTRYPOINT_ARG_LIST
To: bruce.ashfield@gmail.com
Cc: Joshua Watt <JPEWhacker@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000038f81e0607883931"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 17:25:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8355

--00000000000038f81e0607883931
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 1:23=E2=80=AFPM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Thu, Oct 12, 2023 at 12:52=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.co=
m> wrote:
>
>> The "entrypoint arguments" (command) is allowed to be a list of
>> arguments to pass to the entrypoint. However, the current
>> OCI_IMAGE_ENTRYPOINT_ARGS variables doesn't support however. In order to
>> maintain backward compatibility, a new variable has to be introduced to
>> that can be split into the multiple arguments required
>>
>>
> I haven't looked in detail, but the original intent of that variable IS t=
o
> have more than
> one argument. I was just the only current user of them, and only had one
> argument
> that needed to be passed.
>
> I'd rather not have a new variable, but just change the processing to do =
1
> or more
> arguments in the existing variable.
>
>
Which if I'm not mistaken, is your first patch :)

Bruce



> I'll also have to figure out how to make the sloci backend work, but
> that's a different
> question.
>
> Bruce
>
>
>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>  classes/image-oci-umoci.inc | 3 +++
>>  classes/image-oci.bbclass   | 1 +
>>  2 files changed, 4 insertions(+)
>>
>> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
>> index 6c7f244..da93570 100644
>> --- a/classes/image-oci-umoci.inc
>> +++ b/classes/image-oci-umoci.inc
>> @@ -103,6 +103,9 @@ IMAGE_CMD:oci() {
>>      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
>>         umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd
>> "${OCI_IMAGE_ENTRYPOINT_ARGS}"
>>      fi
>> +    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARG_LIST}" ]; then
>> +       umoci config --image $image_name:${OCI_IMAGE_TAG} ${@"
>> ".join("--config.cmd %s" % s for s in
>> d.getVar("OCI_IMAGE_ENTRYPOINT_ARG_LIST").split())}
>> +    fi
>>      umoci config --image $image_name:${OCI_IMAGE_TAG} --author
>> ${OCI_IMAGE_AUTHOR_EMAIL}
>>
>>      # make a tar version of the image direcotry
>> diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
>> index 9ddb88b..68045ad 100644
>> --- a/classes/image-oci.bbclass
>> +++ b/classes/image-oci.bbclass
>> @@ -57,6 +57,7 @@ OCI_IMAGE_SUBARCH ?=3D
>> "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.getVar('TUNE
>>
>>  OCI_IMAGE_ENTRYPOINT ?=3D "sh"
>>  OCI_IMAGE_ENTRYPOINT_ARGS ?=3D ""
>> +OCI_IMAGE_ENTRYPOINT_ARG_LIST ?=3D""
>>  OCI_IMAGE_WORKINGDIR ?=3D ""
>>  OCI_IMAGE_STOPSIGNAL ?=3D ""
>>
>> --
>> 2.34.1
>>
>>
>>
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8354):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8354
> Mute This Topic: https://lists.yoctoproject.org/mt/101922305/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/leave/6693017/105081=
0/978058475/xyzzy
> [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000038f81e0607883931
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 12, 2023 at 1:23=E2=80=AFPM Bruce Ashfi=
eld via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a=
> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">=
gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div sty=
le=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 12, 2023 at 12:52=E2=80=AFPM J=
oshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JP=
EWhacker@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">The &quot;entrypoint arguments&quot; (command) is allowed=
 to be a list of<br>
arguments to pass to the entrypoint. However, the current<br>
OCI_IMAGE_ENTRYPOINT_ARGS variables doesn&#39;t support however. In order t=
o<br>
maintain backward compatibility, a new variable has to be introduced to<br>
that can be split into the multiple arguments required<br>
<br></blockquote><div><br></div><div><div style=3D"font-size:small">I haven=
&#39;t looked in detail, but the original intent of that variable IS to hav=
e more than</div><div style=3D"font-size:small">one argument. I was just th=
e only current user of them, and only had one argument</div><div style=3D"f=
ont-size:small">that needed to be passed.</div><br></div><div><div style=3D=
"font-size:small">I&#39;d rather=C2=A0not have a new variable, but just cha=
nge the processing to do 1 or more</div><div style=3D"font-size:small">argu=
ments in the existing variable.</div><div style=3D"font-size:small"><br></d=
iv></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">Which if I&#39;m not mistaken, is your fi=
rst patch :)</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-size:s=
mall"></div><div style=3D"font-size:small">I&#39;ll also have to figure out=
 how to make the sloci backend work, but that&#39;s a different</div><div s=
tyle=3D"font-size:small">question.</div><div style=3D"font-size:small"><br>=
</div><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
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
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8354): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8354" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8354</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101922305/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101922305/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/leave/6693017/1050810/978058475/xyzzy" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/leave/6693017/10508=
10/978058475/xyzzy</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--00000000000038f81e0607883931--

