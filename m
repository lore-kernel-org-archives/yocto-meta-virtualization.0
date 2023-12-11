Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15211C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 14:20:34 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.9329.1702304429125756526
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 06:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cWUFgTId;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: liu.ming50@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28654179ec0so4385934a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 06:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702304428; x=1702909228; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+byUKe7LOKMUBDv0+mrsHQFwDjcn5R9KhXE4VTJWiS8=;
        b=cWUFgTIdYVctFuZMjxnpWZxgAGZ9YeLsfj6/GGDmLqI3bgQqk+oD/KP/5lv3doCEvR
         heXMXm82UqijsQv11YlwDyj7O5RP1i9uk1pIcOO5IMze9vE7a0/e4YttMh7WiNdyV0Sh
         CODkEuT5mXaAVJ6ZktdjpvE+sCimpi1On4x5Y94DCfOLkBWzCEqtX0IxZ6HvJh1RQ+Zb
         069umLHlAcEB2VOR0j4yXFvse/HNMHm1CrxlOaESSFY2XWoYu7kOVxDMy9V6Rq7AAq+w
         eIEcI+8ECQ9iWuzU/No4rfg3wM/jCXTv0UpoqD2afJtIK5M2dw6Fl6GOXAdz949HxRNf
         Vkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702304428; x=1702909228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+byUKe7LOKMUBDv0+mrsHQFwDjcn5R9KhXE4VTJWiS8=;
        b=TrniUDku0wzsI61cS4AWFc7aCZ4Jg02Cg8A/xy0cb8iR9/euGNBG4NdP7DzHuGXxya
         OwFuPMP7heThNtrtrl+wxP5AIY1c3zvnZdw9QKAK5j+2Ze+CVJFQNK8V58o0/B7mtG4N
         pZx3EYi1P9/ZW8UKMvybBePyP3gJ7YWlgx6uVSGPiHZiAwQV6DCpyXGozRvw/25OlZlg
         oAKVEoWfNsyYrv/lxhv/0nIKILFPJexN6YH9Ri/CLJkYtRq99kXHQloU3uuHe3Eg/QY3
         OpU6PzZSsvJYsZibMnXze9O8fcoZHZPE/xHWml31hTQpb563l8GujYHoa9cpcJLGIJQi
         ifWg==
X-Gm-Message-State: AOJu0YykzBEwVJgSyrJEZP4JjUl8UFFQHE7Oi3hzi1FsDMjYnf3+wZW4
	veXkLaw/6MmRlOuFaT2yEsSKPu/H1JqL8Vi+LyU=
X-Google-Smtp-Source: AGHT+IGJpZGxDBG02MlfGRSQDT0SzrIh5I+3AIuWXUQZLbWL+hAEC0G792J1PApvOGPIrBFn9FRfi18i9PbxTOD00RE=
X-Received: by 2002:a17:90b:358a:b0:286:ab8d:19d4 with SMTP id
 mm10-20020a17090b358a00b00286ab8d19d4mr3527079pjb.42.1702304428461; Mon, 11
 Dec 2023 06:20:28 -0800 (PST)
MIME-Version: 1.0
References: <20231211120914.1631095-1-liu.ming50@gmail.com>
 <20231211120914.1631095-3-liu.ming50@gmail.com> <CADkTA4N3qHZAULhP_=C7LhBnnYpTBCF7PctQdDRq4SKqxVR_MQ@mail.gmail.com>
In-Reply-To: <CADkTA4N3qHZAULhP_=C7LhBnnYpTBCF7PctQdDRq4SKqxVR_MQ@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 11 Dec 2023 15:20:16 +0100
Message-ID: <CALatG=6B+J9KehOEH9CJWSxRdkbEO1tbUJUU_xp4f5uebZ+akg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] podman: add alternative link
 for docker
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c237e2060c3ca285"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 14:20:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8503

--000000000000c237e2060c3ca285
Content-Type: text/plain; charset="UTF-8"

Hi, Bruce:

They are both being added in packagegroup-container? If I install that
packagegroup from the current code base, I will get a conflict error?

the best,
thank you

--000000000000c237e2060c3ca285
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Bruce:<div><br></div><div>They are both being added in=
=C2=A0packagegroup-container? If I install that packagegroup from the curre=
nt code base, I will get a conflict error?</div><div><br></div><div>the bes=
t,</div><div>thank you=C2=A0</div></div>

--000000000000c237e2060c3ca285--

