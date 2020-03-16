Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.67717.1584365405132095382
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Mar 2020 06:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mfMDh9yp;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id n8so17656741wmc.4
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Mar 2020 06:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=d4/sCJX0lY2MUqxgEMe0vHHI/K7kaG/W75yOl96TKeo=;
        b=mfMDh9yp06aE16uDKf4daGPA87Fdtk+UQOXEAzYLwRh8p0TOgnb6WgeKuBjbEqI57Y
         DrgFhKf5il05zJOMG+Kbm0grYEN/51Fc8/rqPDmiZWPliYhJfGyw+7W6QGfQwGllIXMd
         4owGXUin5RXcEhMaowtJhaQ8pYvW4mGeOsgGNmtWIuiHvTsDNbSktc55+m201kiKojqa
         SKH83QenyhZ/zwOgK/gFTSMSX/u4O4mGFVye6+M9a6Zcc7KbGun2Xq8ncQZvTehXUuXe
         wpwC9E+zSFW6km8D4DRrR+rtpHEKHVdMC0HbXhFyaqACnkWkBvRhsQVIUcPxR7OXn/AJ
         Hivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=d4/sCJX0lY2MUqxgEMe0vHHI/K7kaG/W75yOl96TKeo=;
        b=WgliMpq3QVb1+JyC2ZQRs20vEOr2P8RpciD2qTu8jT2FfPW1RBunq/r7KU49ohTNMH
         ygzbp2Cu6usAwPiMkskaE3y7Oa8Zms1AjSrorRFt6Xu2j65yD5YH69XCVrfyi689qn+v
         wV9Jvde3L0q3YBerOZhTUuowT9QWnUpqTzXmi6wpAFqL6WXQWFbKvtokTQYrl/rQJedi
         Sq8t2/jTldlA2BMO7tDjCA1R6KtYXNXUH/AZLQMKcCSO6AItBa7rIKt4RYggfsFQN5Ja
         onWBv37bJTBDUydaaIRXo3zvT8o4inn20ECl4O2qhUF/VVChBmEZSq5r6uKU43G7ud+8
         cO7Q==
X-Gm-Message-State: ANhLgQ25yXdVamjSOAEGHSLg9t8NuRet6LZMKj1f8/iBq4UwcHOMRdFF
	hG+UHdUfZwOcTn6WPjr1GRI3CQ8cxpXJzS0aAnplU5LB
X-Google-Smtp-Source: ADFU+vv6DcEvymve4tpDS18e0h9W0B3zH3jMwgPvIKBuGe2UCi7VdpHhPBcoLkTW/mnZ2q0QfebN6yDir6vmuOMIskY=
X-Received: by 2002:a1c:b187:: with SMTP id a129mr25374030wmf.56.1584365403354;
 Mon, 16 Mar 2020 06:30:03 -0700 (PDT)
MIME-Version: 1.0
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Mon, 16 Mar 2020 14:30:09 +0100
Message-ID: <CALatG=4kQzTGd6kKm1LxW9W3Xsab-TKS3TEDf=Fa+BX6bXaPhQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] docker-ce: uprev to 19.03.8
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000fbced05a0f8d1a4"

--0000000000000fbced05a0f8d1a4
Content-Type: text/plain; charset="UTF-8"

Great to know that you've already working on it, please ignore my patches
then.

Thanks.

//Ming Liu

--0000000000000fbced05a0f8d1a4
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Great to know that you&#39;ve already working on it, please ignore my patches then.<div><br></div><div>Thanks.</div><div><br></div><div>//Ming Liu</div></div>

--0000000000000fbced05a0f8d1a4--
