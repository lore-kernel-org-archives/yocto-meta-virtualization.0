Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.7471.1603260007436225648
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 23:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=fZi2rmuz;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 31D5738C08A9
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 23:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=528; q=dns/txt; s=axis-central1;
  t=1603260006; x=1634796006;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bIMrXi44+vQ1dPDD4cDBTEX+heU1nkAW6XGI+VHvjjM=;
  b=fZi2rmuzGDXF0WL+CZwPnBnPCLteHBNfb9vf1tO1xLYWZ6UiUxVL0wYS
   DVJCBprV730XKylfnQVPfZix7JrjlodyoqHuIUwiFPZw/rsIfw9vBLNE4
   PsDa4TQplyuOI0uo8ik9WfS/aYOGButkIoHtL20Oi/+y0EfUSan0szJV+
   bRDr9rEuqVuPas7MdJ/pJB4S9T24RXKSZC+V1kgACtcM+/2I4L/FZ1yyp
   +74wriL113x+26ktLqIwNRuKMN8nLTC8PHdO0Y48+b8BBz2C534dqoqC+
   Nkqez6ctBQE48cog26sbaB1PM6GOvJH6YMJfTm1NF9m6ukaqvy4jLJK3+
   w==;
IronPort-SDR: FZqh7iKOIUWxWqJnmXUa7Q028bSP6LZpFfk2XVKuZdw6Se4VQYqsWZKuIEsYUe5nsywr+/BOve
 Mog2bx9QrN8IaGoOIINS28iAK78tHLtIY0j5yk7tDqu0EudVYqPA377weK+wUmT750Xvx+harK
 cMvcEieOTx+4tifidXR95OKifNHZvcBJQ0V4kADYVD0blVa8Y9nOFgw+cft3lvaHEaVIDrACp3
 8Ar0jNrsgIhs64OUKNGuDVH1o4dzQC5/ZwtTDWFTkeVu3SvuMTlep2sMzz5slA1H0zJYp3ISzg
 9Gs=
X-IronPort-AV: E=Sophos;i="5.77,400,1596492000"; 
   d="scan'208";a="14237887"
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
Date: Wed, 21 Oct 2020 08:00:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201021031033.GA20764@gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020-10-21 05:10, Bruce Ashfield wrote:
> Ha!!!!
>=20
> This applies.

Wonderful, thank you! I guess this is what is called "five times lucky"..=
.

> I'm now testing and completing some of my networking factoring,
> as well as importing / forking some recipes to avoid extra layer
> depends.

Excellent!

BR,

/Joakim
--=20
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com

