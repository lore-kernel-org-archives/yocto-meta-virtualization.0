Return-Path: <marek.belisko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA284CE7B01
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 11:12:54 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.32373.1725621170404785562
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Sep 2024 04:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kJwmWLSh;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: marek.belisko@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so21297931fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Sep 2024 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725621168; x=1726225968; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zmJAZOkLWLD+bVI/CRugHaqIZLQ0s+HlEl8Qbq5OtKs=;
        b=kJwmWLShKAGSY5j8WhGVdEKZ0GUm6qStqFHnVexVJzvRPZu0pS+oKvBrHAOf3tQwvQ
         vmdYaJtYd4mtuFuD3bxKnk6Tfyrw76cYT6vQnL9NrYlPdAMHQj+kuL00I3cWMHHbrxTP
         aUkBTsDGOIbFkgMoPzgbRLbiYVA94sQmlfBzE6BFLxKHMWXTj7iDRxZ2OqldYnSBlZYd
         JFMpkLtAGrln5ke4H3FcOrZGzlNnANGPMl/JEyuMCmoIarJsxHvRPH38ez39Bjsofvea
         uAHddSg3qqaBATRozVBSEX9dc0r9hc1aEXIp2BiIJmnww/4aM6pB0ItdNZiRlDX6d7w1
         uOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725621168; x=1726225968;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmJAZOkLWLD+bVI/CRugHaqIZLQ0s+HlEl8Qbq5OtKs=;
        b=Cc7FkXlshVXRPtaIZtr9oVLRAuTx716R7v008al2uupFRBxm0MpcCmvIZpmATl7SAc
         R2NqDmt+BoH9K1nQ78frW9TV1IQQq3Y4qAn9FR02Cauuz4Hzmh/yarzqdBxa+eRDnuAG
         Y4j+VqvYIxuPYN5HPUoWW2y+08loOoZkX4u+TuWkwieJeqOBc4qqGV1n7CI6kZ3oKuIt
         4rIlbnGqgNvgE3jVDeCxeNQNJCfsVp/3pEz+v2a+VUoMA6NzjPVwClDaF5a+A6+byfWV
         VoVlLlUGgXl6YehuXOYFIVd/sH8S8S+iMmxGfv17UoY1nYbXBq2Y9BXOTLFZ2LKMsh7i
         gl7A==
X-Gm-Message-State: AOJu0Yy+SXqOa+mPIheSK7CNggW8IjWrKLOH3KtAGhkS2vVitGmf8Oqe
	r96yVhsShG7dJrd4fllQRWLyQivYDeCu5m0z/fjs3IJcHGspyH3Z6pOSShk/oXDgKajLDUcx2QG
	jt+1TJQIRl3Vi5q9NGTrgwl9KoBQJbaV/7oo=
X-Google-Smtp-Source: AGHT+IGFYCS9UFaXQAw+bmKJZgFPfsqU34Z5yl4w010z7MI2w0aboCCcJN4ZlJgtY8dGoEA06ZJM3LtzhZgZwRCvhcQ=
X-Received: by 2002:a2e:a983:0:b0:2f1:5561:4b66 with SMTP id
 38308e7fff4ca-2f751f9a132mr15221211fa.44.1725621167472; Fri, 06 Sep 2024
 04:12:47 -0700 (PDT)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 6 Sep 2024 13:12:36 +0200
Message-ID: <CAAfyv340PmSBG6jC-qjPm4kBVeVYfWLukgyBh3pt+wXE+eC52w@mail.gmail.com>
Subject: meta-cloud-services: fluentd issue
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b4694b0621717c8d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Sep 2024 11:12:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8871

--000000000000b4694b0621717c8d
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm including meta-cloud-services to my project in order to have a fluentd
package in my image. When I run the build I'm getting various error that
libraries have incorrect format (e.g.):

ERROR: strptime-0.2.5-r0 do_populate_sysroot: Fatal errors occurred in
subprocesses:
Command '['aarch64-poky-linux-strip', '--remove-section=.comment',
'--remove-section=.note', '--strip-unneeded',
'/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/ext/strptime/strptime.so']'
returned non-zero exit status 1.
Subprocess output:aarch64-poky-linux-strip: Unable to recognise the format
of the input file
`/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/ext/strptime/strptime.so'
Command '['aarch64-poky-linux-strip', '--remove-section=.comment',
'--remove-section=.note', '--strip-unneeded',
'/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/lib/strptime/strptime.so']'
returned non-zero exit status 1.
Subprocess output:aarch64-poky-linux-strip: Unable to recognise the format
of the input file
`/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/lib/strptime/strptime.so'
Command '['aarch64-poky-linux-strip', '--remove-section=.comment',
'--remove-section=.note', '--strip-unneeded',
'/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/extensions/x86_64-linux/3.1.0/strptime-0.2.5/strptime/strptime.so']'
returned non-zero exit status 1.
Subprocess output:aarch64-poky-linux-strip: Unable to recognise the format
of the input file
`/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/extensions/x86_64-linux/3.1.0/strptime-0.2.5/strptime/strptime.so'

and when I check the library it's compiled for x86_64 while my target is
arm64.

I'm using kirkstone branch. Am  I doing something wrong?

Thanks and BR,

marek



-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

--000000000000b4694b0621717c8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m including=C2=A0meta-cloud-s=
ervices to my project in order to have a fluentd package in my image. When =
I run the build I&#39;m getting various error that libraries have incorrect=
 format (e.g.):<br><br></div><div>ERROR: strptime-0.2.5-r0 do_populate_sysr=
oot: Fatal errors occurred in subprocesses:<br>Command &#39;[&#39;aarch64-p=
oky-linux-strip&#39;, &#39;--remove-section=3D.comment&#39;, &#39;--remove-=
section=3D.note&#39;, &#39;--strip-unneeded&#39;, &#39;/data/projects/test-=
build/build/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-=
destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/ext/strptime/strptime.s=
o&#39;]&#39; returned non-zero exit status 1.<br>Subprocess output:aarch64-=
poky-linux-strip: Unable to recognise the format of the input file `/data/p=
rojects/test-build/build/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.=
5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/ext/strpti=
me/strptime.so&#39;<br>Command &#39;[&#39;aarch64-poky-linux-strip&#39;, &#=
39;--remove-section=3D.comment&#39;, &#39;--remove-section=3D.note&#39;, &#=
39;--strip-unneeded&#39;, &#39;/data/projects/test-build/build/tmp/work/cor=
texa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gem=
s/3.1.0/gems/strptime-0.2.5/lib/strptime/strptime.so&#39;]&#39; returned no=
n-zero exit status 1.<br>Subprocess output:aarch64-poky-linux-strip: Unable=
 to recognise the format of the input file `/data/projects/test-build/build=
/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr=
/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/lib/strptime/strptime.so&#39;<br>C=
ommand &#39;[&#39;aarch64-poky-linux-strip&#39;, &#39;--remove-section=3D.c=
omment&#39;, &#39;--remove-section=3D.note&#39;, &#39;--strip-unneeded&#39;=
, &#39;/data/projects/test-build/build/tmp/work/cortexa53-crypto-poky-linux=
/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/extensions/x86_6=
4-linux/3.1.0/strptime-0.2.5/strptime/strptime.so&#39;]&#39; returned non-z=
ero exit status 1.<br>Subprocess output:aarch64-poky-linux-strip: Unable to=
 recognise the format of the input file `/data/projects/test-build/build/tm=
p/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/li=
b/ruby/gems/3.1.0/extensions/x86_64-linux/3.1.0/strptime-0.2.5/strptime/str=
ptime.so&#39;</div><div><br></div><div>and when I check the library it&#39;=
s compiled=C2=A0for x86_64 while my target is arm64.</div><div><br></div><d=
iv>I&#39;m using kirkstone branch. Am=C2=A0 I doing something wrong?=C2=A0=
=C2=A0</div><div><br></div><div>Thanks and BR,</div><div><br></div><div>mar=
ek</div><div><br></div><div><br></div><div><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature">as simple and primitive as possible<=
br>-------------------------------------------------<br>Marek Belisko - OPE=
N-NANDRA<br>Freelance Developer<br><br>Ruska Nova Ves 219 | Presov, 08005 S=
lovak Republic<br>Tel: +421 915 052 184<br>skype: marekwhite<br>twitter: #o=
pennandra<br>web: <a href=3D"http://open-nandra.com" target=3D"_blank">http=
://open-nandra.com</a></div></div></div>

--000000000000b4694b0621717c8d--

