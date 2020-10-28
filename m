Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5724.1603873950495413285
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 01:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@axis.com header.s=axis-central1 header.b=mdnTwQa/;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.yoctoproject.org (Postfix) with ESMTPS id BF7F738C08AE
	for <meta-virtualization@yoctoproject.org>; Wed, 28 Oct 2020 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=631; q=dns/txt; s=axis-central1;
  t=1603873950; x=1635409950;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bWZiC6aY1fN+YVl+RNeSd//xGbAjBcU/1We0Y7Fd6CY=;
  b=mdnTwQa/dfQi0dwwM0wfxaiNsSpTpdJFTslYi3lpymxFU7qkBlkCLEOC
   vmFMN9Ca0ssPywxch72xKrG7jEkH+fWEr0zSNsb2BSEIeGutGl8qaP3WC
   DioWIDYhtIIDtZ1MQMv/eQ7Py9adBz3Nb+MlQudWkOv6oOJKtQLa3ggc6
   pT99ve93Yqa8OwXYWxhI3MAWptER7OqOSzcRc1jQ6d2Sib93cKBTdIMRT
   drgy+6wl5Zw09N5kCItPozCcNmCsaHcwihKio8b1bgMxWBr6P4PWFZHqn
   s+xjUYzlE0SrDW8vq+q12Ug3DQ3ZIcYNmLngO2eiHIWNGwvr4jzUr2QVK
   w==;
IronPort-SDR: Nw56nz9Kn3DhuwQy54+bnE+Pvi2/RhgdzO7+9mjOqnukoifwQWZO/8dFiGw6qXXSBIDRpLmqAZ
 yjfbOTIpJ5ZbP1VQSKgObLwGxg4dEI1MpFvHnAnZzUGX1/+FRW+c19SfnDWzI+NEmy4cr+lejj
 sY4QPQLRXaUuBSMkIIeRcY8krbGyGBZ7ACQ6V5Yjax8PEg45HVBg/qRJd+4FEUP9NqOVn4O2vt
 71rdQ68miGPWrfTR/oH7qBZ5EY1Pam8lFovVXU1FT6aDPbi7qThNkh5Kx7q4RYQZxkqKyx3qev
 cW0=
X-IronPort-AV: E=Sophos;i="5.77,425,1596492000"; 
   d="scan'208";a="14494461"
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <af00b32f-7619-a755-13b1-714675419946@axis.com>
Date: Wed, 28 Oct 2020 09:32:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020-10-26 16:46, Bruce Ashfield wrote:
>=20
> ERROR: k3s-v1.18.9+k3s1-dirty-r0 do_package: QA Issue: k3s:
> Files/directories were installed but not shipped in any package:
>  =C2=A0 /usr/local/bin/k3s-clean
>  =C2=A0 /usr/local/bin/crictl
>  =C2=A0 /usr/local/bin/kubectl
>  =C2=A0 /usr/local/bin/k3s
>=20
> So I added them to the FILES of the k3s package itself (so both
> k3s-server and k3s-agent will get them), is that the split you were
> looking for ?

Yes, it is! In my build, all of those are found in the k3s RPM, although=20
the FILES directive for them is missing. So yes, your fix here is the=20
right one, IMO.

BR,

/Joakim
