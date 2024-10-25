Return-Path: <matthias.schoepfer@googlemail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA7DD0C608
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 12:49:48 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11246.1729860585489116508
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 05:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20230601 header.b=C9PpONcj;
 spf=pass (domain: googlemail.com, ip: 209.85.128.52, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so20590295e9.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Oct 2024 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1729860584; x=1730465384; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRVM0U5OLDYBe/4blsBjXrmLAW/IZXAPEI9VSyCnZlU=;
        b=C9PpONcjkYn9XW7vRnvxxpNlJvWgf5vIYpnAOs2KDVHQQo1bPhEtq2r/lGtYiyDd9d
         zfzdH4RZI4CcnMjhmULmXm1DqoszoYPhulWV4rZh8e2W5PgGZh3PytaYvl7LSXhj/fH3
         mnqiJMS8K1BAIvcdn9RznLGFi6AE8tgwUB6IV6oZD3I8GobDPQPN14XxbaI79Y5lbPPM
         uuzyJPgScz5Z67azPR2ROnvlh7fGFX/3A9K8Ydnfow7nJT543zrRcqYbhc62RYg+uy45
         SHjs8XoS3U+aGbKpnZlBTKe99iFP5KtEbL8holP8lMbqwl/F9MavLCmAnjSxFMWt/ITk
         tX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729860584; x=1730465384;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fRVM0U5OLDYBe/4blsBjXrmLAW/IZXAPEI9VSyCnZlU=;
        b=f2dXOIgd5yp+aLovpoKv9DAGhMfqX211LvXiQf+nG0O85yf1HQhpP9Whc8EtzamqJA
         dMB818VqcZKkJhZf5v6TF6tS7EVp0qpc97bz+sPS/q0HFRvl6IkqGjSMhKZ4oxEYAHez
         dWSQdQHk3qRExod+oxfJX38+rkPUQtfQUDjAhLQcoqOj4160kqt0R7CPBcxmOOeyU5dS
         UAFjSjtuh3i/G6aYgxIzgCOAeZpgdbWw+ssvfzveftPJRf5sh6JDdEuerLJOqhebN0K6
         Sl/jUj0XO7KhFDNOij2X8uN82gYhubfAs0PgkpG7tA2QfOBnY1lcWOizX6/kCgRgoebp
         P+tA==
X-Gm-Message-State: AOJu0YxInmRZ2sBasoNwl08Nrnxx5COVJsyS4RuwplKX0QRPrRUk//4C
	6DIcXRi8VpcaA6/fPSb2oxyuZy/Xkf3F8FkDANwnNKo4srAq/5zUzr9ucQ==
X-Google-Smtp-Source: AGHT+IGrN5wvbb8jz27ZWJ+mkYKTAdBtxFXxI/hSiCaDU2QP5pgXsxNQr/d6krexDUKKpbEvJojQmQ==
X-Received: by 2002:a05:600c:45c6:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-4318c6dd96cmr49171185e9.1.1729860583429;
        Fri, 25 Oct 2024 05:49:43 -0700 (PDT)
Received: from [192.168.178.41] (ip-088-152-186-249.um26.pools.vodafone-ip.de. [88.152.186.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b712d6sm1430554f8f.78.2024.10.25.05.49.42
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 05:49:42 -0700 (PDT)
Message-ID: <14c95bc9-8cd2-4c24-8b9b-cf8bb53f860a@googlemail.com>
Date: Fri, 25 Oct 2024 14:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: meta-virtualization@lists.yoctoproject.org
From: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
Subject: How to write a recipe that downloads a docker image and puts it into
 the (readonly) root file system
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Oct 2024 12:49:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8935

Hi!

I have been searching the web but have only found tons of stuff how to 
build a yocto image in a docker container, and some how to build a 
container from a yocto recipe. I need to embed a (couple of) (docker) 
containers into a readonly root file system. It is meant to be an 
intermediate step before simply integrating all the services directly 
into the image. What can I say.

My Idea is to for example podman pull the image and redirect the storage 
location into the ${D} space. On the machine, it should be possible to 
configure podman to include this directory.

While I can pull images on my host, when I try to write a recipe 
(extending podman to be -native), I get all kinds of funny errors... 
Also tried buildah.

Sorry, I am noob in the side of the containers and their format. I 
always tried to avoid them, as they seem to me as an option to "just 
static link everything" to not have to bother with dependency issues.

Any hints and links are welcome.

```

[storage.options]
# Storage options to be passed to underlying storage drivers

# AdditionalImageStores is used to pass paths to additional Read/Only 
image stores
# Must be comma separated list.
additionalimagestores = [
]
```

Thanks and Regards,

     Matthias


