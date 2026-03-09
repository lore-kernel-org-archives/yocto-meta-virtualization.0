Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B02FEA854A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 01:55:19 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5140.1773021318616056260
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 18:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LEe2dhwn;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-359a5d8b3f8so3190204a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Mar 2026 18:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773021318; cv=none;
        d=google.com; s=arc-20240605;
        b=Uqn2w3UFtxnTfBSXYQ8xrQ5lJ5a1/zjW6N6Pj19uCddgy3qisayeuJLMvR4x0Dapj2
         +AZB3dXNkV6FLiBz8YY8vlZbJzDk1owfr1DiJgREeHccwk08poIlxLNBn7KNqs5iopEt
         PMCCqpQD16Ko3jx9MUf9j2guXxPy1xvR1hhlCtDLyfPgW1dTR4lK8YHiNbNYtiwGNDlv
         SOBgr6gXVp07Dg+HItN5xNirCwK3EZMKh9UoJ95oj81eWtwmxBzWY0dg1e3OWTHN/8jq
         fUL0MQmOSjOqq1z74dwZak2ofhuJfNA8CrhAwx1u0mjxrjmn9PJeGy98HKBVgUeg6CxZ
         MNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=17CqXlJnHKPxMXXcM7N8ENoSsRJRGgrB7W/vi4MvWcU=;
        fh=8OzFwe3BoLAFjF3lwoA+JeAXcwYo7vt2T40Sp9HkQxI=;
        b=A3P/f3VYEURwwcUHVZRN7I60LZv6RdzvTepBA6EJDaJrOCsaHFU/d+0Sv8E54Gy3h6
         ZEPMzrfu+h6qIEPdNwX4PmLLh/4NKa8TrCJBDK+48OZ/U5WADtk+4tOnOk6Ih4hwUZ8t
         rCs9TsWAoKba6C4ATxX6cEUSa4m+pf+wFkVUvLkOzywwTRdWFVrLdqeuWzwdzBnn5MXo
         GHBxsMScHAWvKEpxGt8Iv+9psX2jnYitufFJPj9J65UAJBkADff+mFIjwHqFPE+4AWgK
         w6+cnVIFNHBhocjYRt49Vi8VzvC79VEeCjOvGyA0avlROH1/rVreyS41YGSWjagllzag
         3NWw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773021318; x=1773626118; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=17CqXlJnHKPxMXXcM7N8ENoSsRJRGgrB7W/vi4MvWcU=;
        b=LEe2dhwnumT3iHVK/nS5vydDAU2nMQsQlEI2TX4t5MLyyXMRTP+4sM7c29vm9tsHEH
         zI6RqP3fXuts9jMU3Bxz2UiGODdPUefA1MG7ArXCLN2iA2xzHnMUqQEYZHZtXyY3u1ZD
         EDzAeyqnvp9nn8DjF9dPy9F48WGLzGJK6EGFcm6+Qqu2LmQZKzecV14IV7E7nCdDHPSF
         f45hOpVqKWK7dTnLqZt0DjP8t12KP7GeygVU05o6vr76r2y7N5jr+QnwFnkg5ADtjuF0
         +/YG6cC3DrLzNImGK5tmPsqXAa+43fuO6jB9JxiqM8mzrZbke9T6mTkzY2KZRaO8d0dP
         p1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773021318; x=1773626118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17CqXlJnHKPxMXXcM7N8ENoSsRJRGgrB7W/vi4MvWcU=;
        b=hMpyVBXNObfAtcuhFV5FFJB6/CXpz8i31G6YlnFiIGc5OqJoVz/YShBIOu7AodV3B/
         GcfORZ2zw+gX+GSaabqFQJsVr4CuERvitwcwi+nxuxgYuXZiPFeR07/fCV5cOYAYkB26
         bqOMFn5s9cOtjgHNCjU0/KaNsbAnNPU4t7fThJ2DdJj+SysqnPINzBCeCrRFdqovbtmF
         hE6oWQ1LS7f7Z5K6+Gl/rJIbp3mm1sUl7TSwqPxtJlBU5NLa9289hP5Ut0SWHhyGTSEb
         2FhMK/Uo63OkmT1FOKWDcgSashyWGltH08PHUUPmbkeQKFZP9EciOHdmxAOnGnFpK4VI
         V7cg==
X-Gm-Message-State: AOJu0YxPIS8hT9TTudfznqRBBouriW2TfTZnaryK+umaztw6fsE3UHTR
	tjPEe0MegcLxJAphhqAh3n0kp241R33KJQuoCLJ1Hl3cjEDoZg4Pw2dcz14PvbST1t1cN/l3dsi
	E80B6uG03UBlZf34uQqRGFqgqeOmWanQ=
X-Gm-Gg: ATEYQzwnlxC/QtQFYfe0ZcjDRiNIvPIffHym0Ovg4nLNGrgoNrzBbNZpVrUKtYg3/Ik
	Y/aKUDWyhyhJ0VKmxLcfpi9VFhfV0VMd+A2h+OvOeAvQtCZO+4KCsm9sW1euZOZLx31142tL4Ed
	1FNAxR9z+WGT8YKMmDe3GT13Pe5Mo0/4xoPDYFMNSM8A3wyGq2vifdF3VS9ceGsKdBWfEfxuCC+
	2oQAD+mHN4zzVca6i33y1FWtbAqDllZzE4NGiB9lxGeIjYly8PftUsngS9ERde4Zfsd8S+DySHp
	8eNRCYgzynQve/MBOYlKRp+VfJsoyJHq3w2TZj6F
X-Received: by 2002:a17:90b:4ccf:b0:356:1f96:9fdd with SMTP id
 98e67ed59e1d1-359be34af1bmr8788633a91.33.1773021317692; Sun, 08 Mar 2026
 18:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_5yosWgnNzyVw0QJ=cAsaOG-1-mc6T3=jE+82G9WO7wD2v6Q@mail.gmail.com>
In-Reply-To: <CAA_5yosWgnNzyVw0QJ=cAsaOG-1-mc6T3=jE+82G9WO7wD2v6Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 8 Mar 2026 21:55:05 -0400
X-Gm-Features: AaiRm51KE-eDdvvNvD9fD_m3cRE4EQ38jk1P40i3d7lN9Z7q_1gTzpdd7FeAnNg
Message-ID: <CADkTA4Px08bevbSihX6gDmyX5H3DiSinooKS6x4sE5rwb0_51g@mail.gmail.com>
Subject: Re: [meta-virtualization] GO_MOD_FETCH_MODE vcs broken due invalid tags
To: ricardo.salveti@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d2008a064c8db193"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Mar 2026 01:55:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9626

--000000000000d2008a064c8db193
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 2:57=E2=80=AFPM Ricardo Salveti via lists.yoctoproje=
ct.org
<ricardo.salveti=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:

> Hi,
>
> I was trying to build docker-compose with GO_MOD_FETCH_MODE set to vcs
> today and it fails to build due duplicated entries pointing to the
> same tag but with different commit revisions (failed on fetch). This
> seems to be caused by
>
> https://git.yoctoproject.org/meta-virtualization/commit/scripts?id=3Ddbf7=
20ccb0519a4dbf143dbaed1633527b8d7b60
> and you can see the problematic diff done as part of
>
> https://git.yoctoproject.org/meta-virtualization/commit/recipes-container=
s/docker-compose?id=3D56a7b72a93fd20d9c21ecdc45487a888b76d194c
> :
>
> +SRC_URI +=3D "git://
> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallo=
w=3D1;rev=3D33540a1f603772f9d4b761f416f5c10dade23e96;name=3Dgit_da0444fc_1;=
destsuffix=3Dvcs_cache/74df1e05ff5bf1317fe42883ce7a496c0ad3800044d955163fd3=
f3acca0a0166
> "
> +SRC_URI +=3D "git://
> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallo=
w=3D1;rev=3D33da011f77ade50ff5b6a6fb4a9a1e6d6b285809;name=3Dgit_da0444fc_2;=
destsuffix=3Dvcs_cache/144d2f77c6aa06af51d5820df4e7506c5ecad01c86e770e0027b=
682ff0d3f9a9
> "
> +SRC_URI +=3D "git://
> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallo=
w=3D1;rev=3D43e1dd70ce54ee5b1711930029ae5b4926f78f72;name=3Dgit_da0444fc_3;=
destsuffix=3Dvcs_cache/61395547cb668a679b4d7508a904d02fd50ffe1630e5ffd6f4ef=
293a97c2d3ba
> "
> +SRC_URI +=3D "git://
> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallo=
w=3D1;rev=3D59db8d763f22395595c26ee1cae0886b57141b3a;name=3Dgit_da0444fc_4;=
destsuffix=3Dvcs_cache/34a6c6ff0efd234ebc0cc2a5cfdad07405fca7403da460f8d25b=
fb69091bc0c5
> "
> +SRC_URI +=3D "git://
> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallo=
w=3D1;rev=3D5ac8a444bdc56cee774f8f2b3382156bd27c63c3;name=3Dgit_da0444fc_5;=
destsuffix=3Dvcs_cache/fefde8e557c698aecc8d48f3c3d82b7fea1eb55451adbc71dbed=
3a8871ed8e13
> "
> +SRC_URI +=3D "git://
> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallo=
w=3D1;rev=3D665e8c7367d1ecf644cea2d163019ef59c13d554;name=3Dgit_da0444fc_6;=
destsuffix=3Dvcs_cache/7389e79775019a8b50e34efbdfd1a6f9ee910ef3822e04963ba4=
44b3d04db399
> "
> +SRC_URI +=3D "git://
> go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallo=
w=3D1;rev=3D8c9f86f7a55f5af45a9080f6ed3ac915382d369c;name=3Dgit_da0444fc_7;=
destsuffix=3Dvcs_cache/2b23297aec08f23623501029a20a4eee604e87ce090001ef6ad0=
a5930d799dd5
> "
>
> They are all pointing to the v0.3.0 tag, but all using different git
> revisions, which will cause fetcher to fail. I tried to have a quick
> look into the go mod fetcher but wasn't able to quickly identify a fix
> there.
>

This was already reported, but I can't reproduce the failure.

Obviously if I wasn't building and testing it, it wouldn't be in the tree.

Bruce



>
> Example of the failure:
>
> ERROR: docker-compose-v5.0.0-r0 do_unpack: Bitbake Fetcher Error:
> FetchError("The revision the git tag 'v0.3.0' resolved to didn't match
> the SRCREV in use (97ca0e3821bf3a3cf6ea2441ece139e524802385 vs
> 03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50)",
> 'git://
> go.googlesource.com/term;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shall=
ow=3D1;rev=3D03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50;name=3Dgit_2e975dd2_0=
;destsuffix=3Dvcs_cache/39b5e1daf17afc894da71452dbc3a21bfd60c2a69143fd621e2=
f4c38e90360ea
> ')
> ERROR: Logfile of failure stored in:
>
> /home/rsalveti/build/lmp-next/build-lmp/tmp-lmp/work/corei7-64-lmp-linux/=
docker-compose/v5.0.0/temp/log.do_unpack.7110
> ERROR: Task
> (/home/rsalveti/build/lmp-next/build-lmp/conf/../../layers/meta-virtualiz=
ation/recipes-containers/docker-compose/
> docker-compose_git.bb:do_unpack)
> failed with exit code '1'
>
> Other recipes probably have similar issues.
>
> Thanks,
>
> Ricardo
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9625):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9625
> Mute This Topic: https://lists.yoctoproject.org/mt/118208278/1050810
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

--000000000000d2008a064c8db193
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 8, 2026 at 2:57=
=E2=80=AFPM Ricardo Salveti via <a href=3D"http://lists.yoctoproject.org">l=
ists.yoctoproject.org</a> &lt;ricardo.salveti=3D<a href=3D"mailto:oss.qualc=
omm.com@lists.yoctoproject.org">oss.qualcomm.com@lists.yoctoproject.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<=
br>
<br>
I was trying to build docker-compose with GO_MOD_FETCH_MODE set to vcs<br>
today and it fails to build due duplicated entries pointing to the<br>
same tag but with different commit revisions (failed on fetch). This<br>
seems to be caused by<br>
<a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/scripts?=
id=3Ddbf720ccb0519a4dbf143dbaed1633527b8d7b60" rel=3D"noreferrer" target=3D=
"_blank">https://git.yoctoproject.org/meta-virtualization/commit/scripts?id=
=3Ddbf720ccb0519a4dbf143dbaed1633527b8d7b60</a><br>
and you can see the problematic diff done as part of<br>
<a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/recipes-=
containers/docker-compose?id=3D56a7b72a93fd20d9c21ecdc45487a888b76d194c" re=
l=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-virtua=
lization/commit/recipes-containers/docker-compose?id=3D56a7b72a93fd20d9c21e=
cdc45487a888b76d194c</a>:<br>
<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D33540a1f603772f9d4b76=
1f416f5c10dade23e96;name=3Dgit_da0444fc_1;destsuffix=3Dvcs_cache/74df1e05ff=
5bf1317fe42883ce7a496c0ad3800044d955163fd3f3acca0a0166" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D33540a1f603772f9d4b761f416f5c10dade23e96;name=
=3Dgit_da0444fc_1;destsuffix=3Dvcs_cache/74df1e05ff5bf1317fe42883ce7a496c0a=
d3800044d955163fd3f3acca0a0166</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D33da011f77ade50ff5b6a=
6fb4a9a1e6d6b285809;name=3Dgit_da0444fc_2;destsuffix=3Dvcs_cache/144d2f77c6=
aa06af51d5820df4e7506c5ecad01c86e770e0027b682ff0d3f9a9" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D33da011f77ade50ff5b6a6fb4a9a1e6d6b285809;name=
=3Dgit_da0444fc_2;destsuffix=3Dvcs_cache/144d2f77c6aa06af51d5820df4e7506c5e=
cad01c86e770e0027b682ff0d3f9a9</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D43e1dd70ce54ee5b17119=
30029ae5b4926f78f72;name=3Dgit_da0444fc_3;destsuffix=3Dvcs_cache/61395547cb=
668a679b4d7508a904d02fd50ffe1630e5ffd6f4ef293a97c2d3ba" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D43e1dd70ce54ee5b1711930029ae5b4926f78f72;name=
=3Dgit_da0444fc_3;destsuffix=3Dvcs_cache/61395547cb668a679b4d7508a904d02fd5=
0ffe1630e5ffd6f4ef293a97c2d3ba</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D59db8d763f22395595c26=
ee1cae0886b57141b3a;name=3Dgit_da0444fc_4;destsuffix=3Dvcs_cache/34a6c6ff0e=
fd234ebc0cc2a5cfdad07405fca7403da460f8d25bfb69091bc0c5" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D59db8d763f22395595c26ee1cae0886b57141b3a;name=
=3Dgit_da0444fc_4;destsuffix=3Dvcs_cache/34a6c6ff0efd234ebc0cc2a5cfdad07405=
fca7403da460f8d25bfb69091bc0c5</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D5ac8a444bdc56cee774f8=
f2b3382156bd27c63c3;name=3Dgit_da0444fc_5;destsuffix=3Dvcs_cache/fefde8e557=
c698aecc8d48f3c3d82b7fea1eb55451adbc71dbed3a8871ed8e13" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D5ac8a444bdc56cee774f8f2b3382156bd27c63c3;name=
=3Dgit_da0444fc_5;destsuffix=3Dvcs_cache/fefde8e557c698aecc8d48f3c3d82b7fea=
1eb55451adbc71dbed3a8871ed8e13</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D665e8c7367d1ecf644cea=
2d163019ef59c13d554;name=3Dgit_da0444fc_6;destsuffix=3Dvcs_cache/7389e79775=
019a8b50e34efbdfd1a6f9ee910ef3822e04963ba444b3d04db399" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D665e8c7367d1ecf644cea2d163019ef59c13d554;name=
=3Dgit_da0444fc_6;destsuffix=3Dvcs_cache/7389e79775019a8b50e34efbdfd1a6f9ee=
910ef3822e04963ba444b3d04db399</a>&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;protoco=
l=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D8c9f86f7a55f5af45a908=
0f6ed3ac915382d369c;name=3Dgit_da0444fc_7;destsuffix=3Dvcs_cache/2b23297aec=
08f23623501029a20a4eee604e87ce090001ef6ad0a5930d799dd5" rel=3D"noreferrer" =
target=3D"_blank">go.googlesource.com/sys;protocol=3Dhttps;nobranch=3D1;tag=
=3Dv0.3.0;shallow=3D1;rev=3D8c9f86f7a55f5af45a9080f6ed3ac915382d369c;name=
=3Dgit_da0444fc_7;destsuffix=3Dvcs_cache/2b23297aec08f23623501029a20a4eee60=
4e87ce090001ef6ad0a5930d799dd5</a>&quot;<br>
<br>
They are all pointing to the v0.3.0 tag, but all using different git<br>
revisions, which will cause fetcher to fail. I tried to have a quick<br>
look into the go mod fetcher but wasn&#39;t able to quickly identify a fix<=
br>
there.<br></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small">This was already reported, but I can&#39;t reproduce=
 the failure.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Obviously i=
f I wasn&#39;t building and testing it, it wouldn&#39;t be in the tree.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Example of the failure:<br>
<br>
ERROR: docker-compose-v5.0.0-r0 do_unpack: Bitbake Fetcher Error:<br>
FetchError(&quot;The revision the git tag &#39;v0.3.0&#39; resolved to didn=
&#39;t match<br>
the SRCREV in use (97ca0e3821bf3a3cf6ea2441ece139e524802385 vs<br>
03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50)&quot;,<br>
&#39;git://<a href=3D"http://go.googlesource.com/term;protocol=3Dhttps;nobr=
anch=3D1;tag=3Dv0.3.0;shallow=3D1;rev=3D03fcf44c2211dcd5eb77510b5f7c1fb02d6=
ded50;name=3Dgit_2e975dd2_0;destsuffix=3Dvcs_cache/39b5e1daf17afc894da71452=
dbc3a21bfd60c2a69143fd621e2f4c38e90360ea" rel=3D"noreferrer" target=3D"_bla=
nk">go.googlesource.com/term;protocol=3Dhttps;nobranch=3D1;tag=3Dv0.3.0;sha=
llow=3D1;rev=3D03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50;name=3Dgit_2e975dd2=
_0;destsuffix=3Dvcs_cache/39b5e1daf17afc894da71452dbc3a21bfd60c2a69143fd621=
e2f4c38e90360ea</a>&#39;)<br>
ERROR: Logfile of failure stored in:<br>
/home/rsalveti/build/lmp-next/build-lmp/tmp-lmp/work/corei7-64-lmp-linux/do=
cker-compose/v5.0.0/temp/log.do_unpack.7110<br>
ERROR: Task (/home/rsalveti/build/lmp-next/build-lmp/conf/../../layers/meta=
-virtualization/recipes-containers/docker-compose/<a href=3D"http://docker-=
compose_git.bb" target=3D"_blank">docker-compose_git.bb</a>:do_unpack)<br>
failed with exit code &#39;1&#39;<br>
<br>
Other recipes probably have similar issues.<br>
<br>
Thanks,<br>
<br>
Ricardo<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9625): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9625" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9625</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118208278/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/118208278/1050810</a><br>
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

--000000000000d2008a064c8db193--

