Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.1098.1599025865315728177
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Sep 2020 22:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=B1BNQZcy;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=222; q=dns/txt; s=axis-central1;
  t=1599025865; x=1630561865;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BoRabff6o20CgQ77k+3J3iXXWOrPpvR89fI0HyQZ5UE=;
  b=B1BNQZcyVJr/IyCkYCGZoFRGxabnCmJOkbek/tqco1PSYgdcrE31bZch
   xuqP70j/YDe0RaQHIp58VJPGA2ajy+T9VeLlCR0OcyjKLllNhBCAvU86O
   igqOci/eORI2nmyjdPDRYz3X9JIFEX4eiEbXmnYpLVXv22wx8mtOkHEOY
   Q5ZmbEqX7ASgto8R67XlqPqG8Md0CAZ7UTli9E2QGVuDt/fO5rCb735Sl
   BL41LKVm6bM+hCCmS/u0u3kl/0gS/uleuC3i2E5eKzKV+a60CtRxkjXFR
   YYucaq7h7DwptFAafUT/U3HuKgfwJ1bPTcPZo7dXYqy5P4efcvTU5eO/J
   Q==;
IronPort-SDR: UbfEYLOttNBxzCWZ/+YyRicWL6pLdRMa3xvEOcVZctdP8tUL3XuCu3B3id4Nxvq8CkEziUKD8t
 +PIZtLv9hRv/7CWOFAEN5Wo6F1D90On/cpoWdrEJWIedWawnqRx/U38MhXjdZqJ1QqOn5S40FY
 3eUUdrZcUCP2jjb0Yt+LVBaxgcwfN8rCRfb8iJSv3iRghGJ/kJeC69mZdSf56BZPqK2LzjOTQi
 t/lmZrFA0VSAb6wytzb9/MBfvmLJbf8qXZPrSNWsl1GDTAkg/oiTcs/cVOQ11ISkAmyz6rNq5A
 tsM=
X-IronPort-AV: E=Sophos;i="5.76,381,1592863200"; 
   d="scan'208";a="12460201"
From: "Joakim Roubert" <joakim.roubert@axis.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] [PATCH] Adding k3s recipe
Thread-Topic: [meta-virtualization] [PATCH] Adding k3s recipe
Thread-Index: AQHWfqX4U4fYEzkhuUavuHiYdIQPdalQqOWAgAQzzfA=
Date: Wed, 2 Sep 2020 05:51:00 +0000
Message-ID: <bb2272690dca495b9de7b1730fc25c8d@XBOX03.axis.com>
References: <CADkTA4OfiXvb=9D0NWU8-Oy9qzivgSLA3byvBDN6Ly=yyEc=Tg@mail.gmail.com>
 <18858.1598775427877475112@lists.yoctoproject.org>
 <CADkTA4O48=2Mwwn4VzZEcHHgtdDDpAL4onZmwrmwa=ye1zAMLA@mail.gmail.com>
In-Reply-To: <CADkTA4O48=2Mwwn4VzZEcHHgtdDDpAL4onZmwrmwa=ye1zAMLA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBCdXQgSSdtIGJhY2sgb24gdGhpcyB0aGlzIGNvbWluZyB3ZWVrLCBhbmQgd2UnbGwgZGVmaW5p
dGVseSBoYXZlIHNvbWV0aGluZyBiZWZvcmUgdGhlIGZhbGwgcmVsZWFzZSBicmFuY2hlcy4NCg0K
VGhpcyBpcyByZWFsbHkgZ29vZCBuZXdzIQ0KDQpCUiwNCg0KL0pvYWtpbQ0KDQo=
