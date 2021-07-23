Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.4165.1627075004355623592
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 23 Jul 2021 14:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BEcQPuYz;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: robert.berger.yocto.user@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id e2so3698945wrq.6
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 23 Jul 2021 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gwUQID1w4naW0jnzJXJYoDs3nx1MdJ3EJlm2FkKUNbY=;
        b=BEcQPuYzZ02xM/1+Yvph+pg2BY6KA8gWZdyvZvOX9iPLQjujTF7N+0aqSHji9Gn9es
         6mZKt2rbUKLpeptxOfX5uYcCOstZSQtoAqfRlQ0ZWe/sheRNg3RReLP0hzLdv5Xs0UhR
         h764aytZmvXkCA+6NovfpI8rw2f8v66LdaJUwDds4KtCdRDtbEwtUx42j3r/y0ctArQ6
         4/QOmgWUM+nZ1bRFtXMOiYj6hL+afJQx3GiYIKTGzDsomrr1bno7ObUE5dYFJRCf9l8+
         egL/jLZpJ95yROA/LqvnWDNHIYKrvNyKHaebu3SolZdviAWVznoJIDkhJO9/U7Uh+eYH
         5Vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gwUQID1w4naW0jnzJXJYoDs3nx1MdJ3EJlm2FkKUNbY=;
        b=U2BmCsJGQS7Io0czCIKsuEDaT3oG+sKsFItq1jQYZUDuwKjEsKQa8+tN3xtAGZzEzW
         3+1IgSXbYRLDg67tkYquw7NFuEmkKA0amZ4ruV7ILtCqdNU9nA5fyhaSH/ltqD+LUbin
         1YC0pGg9LtGiiZyF9MG3WoyrG/ccifxh30eelORL2PY5U+ZwmkSel6iqwyblNDABG+Y7
         aNYRdcOOQ+K1eGeLDq/rPiZV893m1sZJ8tAm32hTw101tfq7s8Ihw9sacAZ4IvXdRwQO
         PGs8jkAqiw+0SLXGHfPBXXZctyFF+RcsoyVMZuoCvYdT/niD/2ih9sXndUjRSw9Jbdbk
         eYIQ==
X-Gm-Message-State: AOAM53278/wWGxMwvlTHrk51zwS4kuf7w/bzHKG308MGc6OUrISY48xf
	6nVWtkzaYXG4nQWAoDV9a6w8q7Nmal5GNw==
X-Google-Smtp-Source: ABdhPJwS9YflMbb1iCN7aomSDeOFjH+7CahBAakCCE+I4r87Y9Baq58PFgXVKUCjLCmVnFFbSamm+Q==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr7174060wri.21.1627075002865;
        Fri, 23 Jul 2021 14:16:42 -0700 (PDT)
Return-Path: <robert.berger.yocto.user@gmail.com>
Received: from [192.168.42.52] (athedsl-4432950.home.otenet.gr. [79.129.148.38])
        by smtp.gmail.com with ESMTPSA id v9sm28914995wml.36.2021.07.23.14.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 14:16:42 -0700 (PDT)
Subject: Re: [meta-virtualization] linux-yocto virtualization requires virtio.scc from yocto-kernel-cache
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <CAFrQVPN-a-5DPmxe3A9-o6U=bwsdGQForwQ-qYUPXsJS1pgdCw@mail.gmail.com>
 <32271.1627021942920151318@lists.yoctoproject.org>
 <CADkTA4Ny_xbg9Tw9zTBVJxzF2d_UAsfaR_Bt9ZWSUsCmzquxuw@mail.gmail.com>
From: "Robert Berger" <robert.berger.yocto.user@gmail.com>
Message-ID: <d340d90e-0ae2-c764-9375-3801ecc47f71@gmail.com>
Date: Sat, 24 Jul 2021 00:16:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Ny_xbg9Tw9zTBVJxzF2d_UAsfaR_Bt9ZWSUsCmzquxuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I am building with my own kernel meta data and that's my little patch:

https://github.com/RobertBerger/manifests/blob/master/meta-virtualization-master/0001-include-virtio.scc.patch

Regards,

Robert

