Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.1091.1612913057404229892
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Feb 2021 15:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iI9DMvet;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: robert.berger.yocto.user@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id g6so203766wrs.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Feb 2021 15:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iDLNNcChHETn2L3IOL6kw5bHwBoOLDk/3rxwYVn8Z18=;
        b=iI9DMvetvih1ySq6QKkNbYDeknDPSy/2jIXb1NxuZrSEDLWpZTtCAZWY+VgslxdCx7
         9Io9d+4WfYdgPoY/JTeuhU2IVWHkUMwD4oZALLjKOyLPxrA6nPgVAGvYzrnAG3ZBIG2v
         2SoklJu4bR5pWQ4P+UJd/HZGcB4LKH4P+JAJuq0ppW8N2u+cqHrC/B7+lRalm16qaqyj
         KirY7607xwDJQq9iklMOHF03+2Y2jiMm1vftGKpZi7atF+e5Z5HuXeEqU9NXyXBmdKRN
         ySVOirg4N2zLFfU8wOTfrXO0KUKwKc5FLDqwOvR12citweFHbogcQQqfUt2BLPdVunQD
         V29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iDLNNcChHETn2L3IOL6kw5bHwBoOLDk/3rxwYVn8Z18=;
        b=qB3NmQdnFahez89mpsWZ+2IqzpUNJzElIDwzfOGGiIDvNX8RjmOk+/N2VJ2msl7Eu7
         7pt7wAOt4oMdENdOq3A4f7YnIYvL3JESomdr9IYlp1LWh0pTdYRHhxE5pcSK0qeSvTfN
         iv46ziSqX6szQx4ljex4gUmDBQAjUGMqjiWYn8OfsO7cq7RGCYyfmryyXK3j/jlymltg
         hgxjoyrs62ETGyRsleeUzZtUV6PKTmOnhK+NGOnrNT5AlCZamq4Mkq5i/lDUAxcY6t/4
         121H1tPBwWKf/ZrPtmSsh88zQDDxXsGnPxy6GaQrpX/QY9iqj/WNbUdiF6IZF5ztdtpS
         cSSw==
X-Gm-Message-State: AOAM533GD2te/fdw0mzsmpfkV5uxSShCq7sqLPpvcKvXOGXWg1tKbiXH
	NH+DfQeIlq24B9YdyAQb1vs=
X-Google-Smtp-Source: ABdhPJz4YzEclSnklRYCV9dU84a6YrBH1wxjgNxeuhyGhr+1N0EBnOCM7a7JApllktCb1k4Pj7O8/A==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr392480wrm.289.1612913055800;
        Tue, 09 Feb 2021 15:24:15 -0800 (PST)
Return-Path: <robert.berger.yocto.user@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-140-5.home.otenet.gr. [2.86.140.5])
        by smtp.gmail.com with ESMTPSA id 67sm335967wmz.46.2021.02.09.15.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 15:24:15 -0800 (PST)
Subject: Re: [meta-virtualization] Importing Docker Images
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Nathan Dunne <Nathan.Dunne@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
 Diego Sueiro <Diego.Sueiro@arm.com>, nd <nd@arm.com>
References: <PR3PR08MB5785F492BD5994B7E472DFD18D8E9@PR3PR08MB5785.eurprd08.prod.outlook.com>
 <CADkTA4PJbhTb9kvaB5DxQC0wf=+u+FdAD_69Qid9rNsOaw1Mmw@mail.gmail.com>
From: "Robert Berger" <robert.berger.yocto.user@gmail.com>
Message-ID: <42dc1a99-f595-eecb-2095-b3f6e19ed73c@gmail.com>
Date: Wed, 10 Feb 2021 01:24:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PJbhTb9kvaB5DxQC0wf=+u+FdAD_69Qid9rNsOaw1Mmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

My comments are in-line.


On 09/02/2021 18:55, Bruce Ashfield wrote:
> 
> I am working on extending the image-oci bbclass to use natively (OE)
> based images and pre-populate them to be runnable via
> podman/docker/runc at boot. That way, we have an integrated solution
> that leverages all of the OE advantages.

With multiconfig this can already be done for quite some time. Startup 
scripts and other config needs to be done in the recipe manually with 
what I have, but I guess it's anyhow hard to automate this.

> 
> (podman is actually easier than docker to do this on the build/cross side)
> 
>>
>> Currently in meta-arm-autonomy we have:
>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm-autonomy/recipes-containers/import-docker-image
>> Which allows a single image file to be included, then imported at boot time. I am currently extending this to allow a list of image files rather than only one, and to use docker-compose for easier control of multiple containers. This could live in meta-virtualization rather than meta-arm-autonomy if the community believes this a good idea.
> 
> 
> I'll work on getting my WIP image class pushed to master-next as soon
> as possible, but I have some other pending issues to resolve first.

Happy to work with you on that as well.

If we really want "container images as binaries" it's as easy as 
creating them with meta-virtualization and pushing them to some registry 
e.g. docker.io and pulling them from the target. With all the well known 
licensing and reproducebility issues.

> 
> Bruce
> 
>>
>> Let me know what you think,
>> Nathan

Regards,

Robert

>>
>>
>>
> 
> 
> 
> 
> 
> 

