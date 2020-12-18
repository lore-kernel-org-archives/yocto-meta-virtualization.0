Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.10761.1608301463853680806
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 06:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=C4insHnW;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5D31B38C06A1
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Dec 2020 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608301463;
  x=1639837463;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=dKHyLpEq/po9ZnwzFU7fYoFq6PRTcpclyRm17L2Zhnc=;
  b=C4insHnWa5PCUgcSOgpGw3UszbRlu8WWdB2I1oi4iFdbna+edLKLDJjw
   cc19aAQU72SdoeA8h/56IifDLKB9A7NXDth3HOF0Ey8EJCVurTmtUWJLP
   dXp6oVIZdC/rGXfH1SeZFcLOmynpMS0iUYp6hgcfP37lgDJr5kY3SPaIV
   fPEgr8NSIFHLfyDArCrresAM/7YzLvA1DRBcU65GLmr4pMx3rk+PDoOCj
   JydqDGMMCF/eaO0oBjXCXoD3zvKYiNpxywh6B3dvga/68ROQbzL9l8Spx
   mWcY1E5RuTGyO3LW/pIpLxt4gbJ3C9YW0HS+QVXvKFih7AATMqKnTzd2G
   Q==;
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: meta-virtualization <meta-virtualization@yoctoproject.org>
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com>
 <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
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
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <24132353-1078-bdbd-5856-3c644d615f1a@axis.com>
Date: Fri, 18 Dec 2020 15:23:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4OOc_dL_8KVDFShHH5AkQXnpFoUAC7VOPEqnAPGH6qwLQ@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-12-15 19:58, Bruce Ashfield wrote:
> 
> For now, I'd suggest waiting a couple more days, since I may have it
> solved shortly.

If there continues to be strange problems, perhaps the Rancher guys 
would be interested in helping out? They are both skilled and friendly, 
and given Rancher's focused agenda on being _the_ Kubernetes provider 
for edge with k3s, I guess having k3s in meta-virtualization would be 
attractive to them.

BR,

/Joakim

