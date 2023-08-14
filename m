Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501A7C001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 19:03:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.116341.1692039782241189655
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 12:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HVVvHGsZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so42107435e9.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 12:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692039780; x=1692644580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EBXtuDWaGTH6S3Tub9VHedsdAW70vPyYsI9iUlUd1rI=;
        b=HVVvHGsZjUIJ9E9SzD8C5EveAKCOVAwQf5bbyb5rWSTnKILz/CFKONedMHqMtT6q/q
         R0wqd5jfK0KZvP56o5Cs6oSGxU7YUULS+N0793//SSnKBb2GdxiP1y0Y5IHXM155rGKm
         kCEyRDzxOrVxWgMQLKmLCSul+R9L/kq1KHMt2mE6OaO+jSwLTr5iTeARLwI/Xg3pijFW
         j3B86pZYusXhpQRv3YeKleXiwbzHjKvv7t3+WErcO6qBMcxbrCp0hLbuEmdlfArKLSa0
         5RgOCWYfXCOsjnaElv2dS1NWM32j1Vozra1IjouFjgzUgtEJKzYuL8oOKCN7AlEF/y1X
         12hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692039780; x=1692644580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBXtuDWaGTH6S3Tub9VHedsdAW70vPyYsI9iUlUd1rI=;
        b=foaLVDpCbbhI5s5LmveoWcmEeekY/tvx7H/XnPGjw5ldWSoAIXkj7yzlC2E/S3zAua
         SOI/ZxVjHYOKWSj7WmcZAXp5K+4p2t4Mb+M9dPn9nH/IVZIhjrBkHZQQLtzHRXhwWPIJ
         /ZMBabePvoN9JW9wqDyDk7O32glLdM/a16kHjo9HicJgtOz4UXDY7UP19iASvHckYxEJ
         7AvSvaa7bjgWNDFh0+wKQJYdzqxsYVqIqDfKi6grMRufoVzh1bfH9CRekFDu2uTbo4d8
         ypbqg2KQpHGKMwe0RezCfyZl7/TXKh1WWBdD7vfVyqCG2Fim7o0hIKlPvH45DPKyMMHz
         QsUw==
X-Gm-Message-State: AOJu0YxJ7SQk8nl9BHzN/WhbffbCOvmFWR0ZEoJ9oW3fP2FNuogldX9X
	Gy/N5p4VCryQD90SRtWGY7+YBOIk8kfduHf7VLqpt/0tBvg=
X-Google-Smtp-Source: AGHT+IFWuel8TDXgYeJzCqEKxhEeHpOabvskcXEgPalXi17ttvdqFH1QJc2hUkvG0janQtFp63sZncZAiyZI7mFkIYw=
X-Received: by 2002:adf:f0c8:0:b0:319:7aa5:b880 with SMTP id
 x8-20020adff0c8000000b003197aa5b880mr2165760wro.48.1692039780151; Mon, 14 Aug
 2023 12:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230814151356.1001953-1-Martin.Jansa@gmail.com>
 <177B48E707B1FD85.12117@lists.yoctoproject.org> <CA+chaQei9w4MDNhZPojhKXf=Tx-DTt2PE0UapJ3eis5eciTnDw@mail.gmail.com>
In-Reply-To: <CA+chaQei9w4MDNhZPojhKXf=Tx-DTt2PE0UapJ3eis5eciTnDw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Aug 2023 21:02:44 +0200
Message-ID: <CA+chaQcKaxcvOF6Y6p8D-B80NwCEqZVuh6QvpA-9Rm=TUiFTMQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][RFC][PATCHv2] docker: update to
 v20.10.25 + 58 commits to fix compatibility with go currently in kirkstone
To: Martin.Jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000ac2820602e6b6a1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 19:03:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8191

--0000000000000ac2820602e6b6a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 9:00=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

>
>
> On Mon, Aug 14, 2023 at 5:17=E2=80=AFPM Martin Jansa via lists.yoctoproje=
ct.org
> <Martin.Jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> RFC, because I've only build tested this in kirkstone, waiting for whole
>> image to build to test it in runtime
>>
>
> Passed minimal sanity check on rpi4-64:
>

my fat fingers didn't pass copy&pasting test, here 2nd try:

root@rpi4:~# systemctl start docker.service
root@rpi4:~# docker run -it --rm ubuntu
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
5af00eab9784: Pull complete
Digest:
sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3dd7f508
Status: Downloaded newer image for ubuntu:latest
root@92414c21da3d:/#
root@92414c21da3d:/# cat /etc/lsb-release
DISTRIB_ID=3DUbuntu
DISTRIB_RELEASE=3D22.04
DISTRIB_CODENAME=3Djammy
DISTRIB_DESCRIPTION=3D"Ubuntu 22.04.2 LTS"

--0000000000000ac2820602e6b6a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Aug 14, 2023 at 9:00=E2=80=AFPM M=
artin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmai=
l.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Aug 14, 2023 at 5:17=E2=80=AFPM Martin Jansa via <a href=3D"http://list=
s.yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;Martin=
.Jansa=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_bla=
nk">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">RFC, because I&#39;ve =
only build tested this in kirkstone, waiting for whole image to build to te=
st it in runtime</div></blockquote><div><br></div><div>Passed minimal sanit=
y check on rpi4-64:</div></div></div></blockquote><div><br></div><div>my fa=
t fingers didn&#39;t pass copy&amp;pasting test, here 2nd try:</div><div><b=
r></div><div>root@rpi4:~# systemctl start docker.service<br>root@rpi4:~# do=
cker run -it --rm ubuntu<br>Unable to find image &#39;ubuntu:latest&#39; lo=
cally<br>latest: Pulling from library/ubuntu<br>5af00eab9784: Pull complete=
 <br>Digest: sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33=
a3dd7f508<br>Status: Downloaded newer image for ubuntu:latest<br>root@92414=
c21da3d:/#</div><div>root@92414c21da3d:/# cat /etc/lsb-release <br>DISTRIB_=
ID=3DUbuntu<br>DISTRIB_RELEASE=3D22.04<br>DISTRIB_CODENAME=3Djammy<br>DISTR=
IB_DESCRIPTION=3D&quot;Ubuntu 22.04.2 LTS&quot;<br></div></div></div>

--0000000000000ac2820602e6b6a1--

