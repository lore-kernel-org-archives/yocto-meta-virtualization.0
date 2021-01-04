Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.10622.1609744337281999169
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 03 Jan 2021 23:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=RehTypkN;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 891DF38C069E
	for <meta-virtualization@yoctoproject.org>; Mon,  4 Jan 2021 07:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1609744335;
  x=1641280335;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=VDWjQ+lC4HUQfR7A+/99qLjVs5yjOWLZeOhguruh5V0=;
  b=RehTypkNOIZn9sJMO9aDCcW/JF6YfWKOQtXAy6X2zxefQH1hNl9Jd3eD
   iKb2j4gvuQ0ZrvMdMrdkkwqHFv3VuVItabmTQzOZk5AnqCcicwSpzii32
   gX8Gt1HRnfasODj5SuJU0ieZCEf2QpVPbnB1uiXvcENQU1nOMFLWIqy37
   ew3C4ZDt988pYzeyLScWzRqOsbvQitpS4ThU+sn+cWuP/gfXBRDBX458v
   5v6n8spB8ahjP3oqYRKuPPcEUSJxnCnGSOXm3XZhNcvzH7rybyYJqpP9v
   vPrChyfBG7YDEm+qp5VK2hhxHv6lA3NP3eGDOP8SokV9QPDslPA4ohOUc
   w==;
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: meta-virtualization <meta-virtualization@yoctoproject.org>
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com>
 <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
 <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com>
 <1648529A6FD37D30.5807@lists.yoctoproject.org>
 <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com>
 <6eaac6fd-21cd-8d06-eeb5-c8a77516bdbe@axis.com>
 <CADkTA4PwG9_aUk07u=RttdwurGrbP1YPG1g+gE5H=q8r73ANhA@mail.gmail.com>
 <DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4Mg_+4Aj216FyYqVA22g4vBSgt6f2zURvXjNikhwMJutw@mail.gmail.com>
 <DBBPR08MB472507C6C2E14C13A773FF2C91C60@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4OOc_dL_8KVDFShHH5AkQXnpFoUAC7VOPEqnAPGH6qwLQ@mail.gmail.com>
 <24132353-1078-bdbd-5856-3c644d615f1a@axis.com>
 <CADkTA4Nrekx9LMEQP4ZJ=6T6Vt1tLMeDEgpY9xW4YY3aZEa83w@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <244150c1-c21d-9339-d189-ed9e80d79a37@axis.com>
Date: Mon, 4 Jan 2021 08:12:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4Nrekx9LMEQP4ZJ=6T6Vt1tLMeDEgpY9xW4YY3aZEa83w@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020-12-22 17:15, Bruce Ashfield wrote:
> So that rules out something in the kernel (and its config), the go=20
> version or something in our rootfs being missing.

That surely narrows things down.

> But as soon as you fetch the rancher binary, restart the services ..
> the containers come up just fine.

Is this the same thing that happened for the k3s v1.18.9 build too?

> I'm diving deeper to try and sort it out.

=F0=9F=91=8D

BR,

/Joakim
