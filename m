Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
 by mx.groups.io with SMTP id smtpd.web08.14250.1633016400880373773
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 08:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.co.uk header.s=amazon201209 header.b=IJlbjvHK;
 spf=pass (domain: amazon.co.uk, ip: 99.78.197.218, mailfrom: prvs=900604687=stephibb@amazon.co.uk)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1633016401; x=1664552401;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:mime-version:content-transfer-encoding:subject;
  bh=PQwdqXF8ZSb7aaQ4SVtI9Jx80hK7YDEGec84l1k85uU=;
  b=IJlbjvHK+3G3ZekHdVbiyRFEV5Ei0gsJMuA3nuFhhZYkEhfdJIl+L8Xg
   dUyd0Xlw2BG0/rv0VD6utBf9wJxd/r0mNcHTnFmlRM1GxgjeNCcStDrdZ
   eytJCutlcWbfFIkMERkouuSNihLuJGIVzMuLNLtcQbSd8w3VidFnKFyCB
   Y=;
X-IronPort-AV: E=Sophos;i="5.85,336,1624320000"; 
   d="scan'208";a="30818877"
Subject: Re: [meta-virtualization] Docker 20.10.3 breaks due to iptables v1.8.7 (legacy) incompatibility #meta-virtualization
Thread-Topic: [meta-virtualization] Docker 20.10.3 breaks due to iptables v1.8.7 (legacy)
 incompatibility #meta-virtualization
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2c-a264e6fe.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP; 30 Sep 2021 15:39:52 +0000
Received: from EX13D01EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2c-a264e6fe.us-west-2.amazon.com (Postfix) with ESMTPS id A5C0E41FB1;
	Thu, 30 Sep 2021 15:39:51 +0000 (UTC)
Received: from EX13D01EUB004.ant.amazon.com (10.43.166.180) by
 EX13D01EUB003.ant.amazon.com (10.43.166.248) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Thu, 30 Sep 2021 15:39:50 +0000
Received: from EX13D01EUB004.ant.amazon.com ([10.43.166.180]) by
 EX13D01EUB004.ant.amazon.com ([10.43.166.180]) with mapi id 15.00.1497.023;
 Thu, 30 Sep 2021 15:39:50 +0000
From: "Stephen" <stephibb@amazon.co.uk>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Thread-Index: AQHXtglfgoZ/iRiCKE6Ulc+hz+Tqc6u8s8WAgAATuYA=
Date: Thu, 30 Sep 2021 15:39:49 +0000
Message-ID: <EEB11201-E4B0-4045-8C31-026DBF2AB43F@amazon.com>
References: <sR4y.1633012897405396850.uLez@lists.yoctoproject.org>
 <CADkTA4PEGOtu8EnSjfVCv=EJynX2hHo7t40=htGdrfchNL3gcg@mail.gmail.com>
In-Reply-To: <CADkTA4PEGOtu8EnSjfVCv=EJynX2hHo7t40=htGdrfchNL3gcg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
MIME-Version: 1.0
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F7090375A302741A3F20F9194BDD6CF@amazon.com>
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB0aGUgcmVwbHkgQnJ1Y2UgX18gTGV0IG1lIGtub3cgaWYgdGhlc2UgZGV0YWls
cyBoZWxwPw0KDQpyb290QGdlbmVyaWMtYXJtNjQ6fiMgdW5hbWUgLXINCjUuMTAuNDYteW9jdG8t
c3RhbmRhcmQNCg0KT25seSBzZXR0aW5nIHRoZXNlIHR3byBrZXJuZWwgY29uZmlncyBhdCB0aGUg
bW9tZW50Og0KQ09ORklHX0VOQV9FVEhFUk5FVD15DQpDT05GSUdfQkxLX0RFVl9OVk1FPXkNCg0K
QW5kIHRoZXNlIGFyZSB0aGUgbGF5ZXJzLCBydW5uaW5nIGhhcmtub3R0Li4uDQpkcnd4cnd4ci14
IDEyIHVidW50dSB1YnVudHUgNDA5NiBTZXAgMjkgMTQ6MDIgbWV0YS1hcm0vDQpkcnd4cnd4ci14
ICA4IHVidW50dSB1YnVudHUgNDA5NiBTZXAgMjkgMTQ6MDAgbWV0YS1ld2FvbC8NCmRyd3hyd3hy
LXggMTEgdWJ1bnR1IHVidW50dSA0MDk2IFNlcCAyOSAxNTowOSBtZXRhLW9wZW5lbWJlZGRlZC8N
CmRyd3hyd3hyLXggMjQgdWJ1bnR1IHVidW50dSA0MDk2IFNlcCAyOSAxNDowMiBtZXRhLXNlY3Vy
aXR5Lw0KZHJ3eHJ3eHIteCAxNyB1YnVudHUgdWJ1bnR1IDQwOTYgU2VwIDI5IDE0OjAyIG1ldGEt
dmlydHVhbGl6YXRpb24vDQoNCg0K77u/T24gMzAvMDkvMjAyMSwgMTY6MzIsICJCcnVjZSBBc2hm
aWVsZCIgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICBDQVVUSU9OOiBU
aGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZp
cm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KDQoNCg0KICAgIE9u
IFRodSwgU2VwIDMwLCAyMDIxIGF0IDEwOjQxIEFNIFN0ZXBoZW4gdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcNCiAgICA8c3RlcGhpYmI9YW1hem9uLmNvLnVrQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmc+IHdyb3RlOg0KICAgID4NCiAgICA+IEhlbGxvIGFsbCENCiAgICA+DQogICAgPiBUaGUgY3Vy
cmVudCBtZXRhLXZpcnR1YWxpc2F0aW9uIGRvY2tlciBpcyBpbmNvbXBhdGlibGUgd2l0aCB0aGUg
bGVnYWN5IHYxLjguNyBpcHRhYmxlcy4NCiAgICA+DQogICAgPiBEb2NrZXIgdmVyc2lvbiAyMC4x
MC4zLCBidWlsZCA0MWIzZWE3ZTQ3IGh0dHA6Ly9sYXllcnMub3BlbmVtYmVkZGVkLm9yZy9sYXll
cmluZGV4L3JlY2lwZS8xNzY4MTcvDQogICAgPg0KICAgID4gaXB0YWJsZXMgdjEuOC43IChsZWdh
Y3kpIGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC5jZ2kvcG9reS9wbGFpbi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvaXB0YWJsZXMvDQogICAgPg0KICAgID4gbGV2ZWw9aW5mbyB0aW1l
PTIwMjEtMDktMzBUMDg6NTg6NTZaIG1zZz0iVGFza0hhbmRsZXI6IFNlbmRpbmcgdGFzayBjaGFu
Z2U6IFRhc2tDaGFuZ2U6IFthcm46YXdzOmVjczpldS13ZXN0LTE6MTE2NTg5OTM1OTYwOnRhc2sv
R3Jhdml0b25JRC1lY3MtRUNTR3JhIHZpdG9uMkRBNTQ1NjA4LXR6ZEczYnVwZ0xjbi9lZjhkOWVh
MTVhNDM0YzI5OGE5NjIzNTUxZDM5YzZhYiAtPiBTVE9QUEVELCBLbm93biBTZW50OiBOT05FLCBQ
dWxsU3RhcnRlZEF0OiAyMDIxLTA5LTMwIDA4OjU4OjU1LjgwOTQ2MDkzNSArMDAwMCBVVEMgbT0r
NSAyMzE1Ljc2NTcwNjAwMSwgUHVsbFN0b3BwZWRBdDogMjAyMS0wOS0zMCAwODo1ODo1NS45MTkz
NTE3MTcgKzAwMDAgVVRDIG09KzUyMzE1Ljg3NTU5Njc4MiwgRXhlY3V0aW9uU3RvcHBlZEF0OiAy
MDIxLTA5LTMwIDA4OjU4OjU2LjE1OTM1NjU1MiArMDAwMCBVVEMgbT0rNTIzMTYuMTE1NjAxNjE3
LCBjb250YWluZXIgY2hhbmdlOiBhcm46YXdzOmVjczpldS13ZXN0LTE6MTE2NTg5OTM1OTYwOnRh
c2svR3Jhdml0b25JRC1lY3MtRUNTR3Jhdml0b24yREE1NDU2MDgtdHpkRzNidXBnTGNuL2VmOGQ5
ZWExNWE0MzRjMjk4YTk2MjMgNTUxZDM5YzZhYiB3ZWIgLT4gU1RPUFBFRCwgUmVhc29uIENhbm5v
dFN0YXJ0Q29udGFpbmVyRXJyb3I6IEVycm9yIHJlc3BvbnNlIGZyb20gZGFlbW9uOiBkcml2ZXIg
ZmFpbGVkIHByb2dyYW1taW5nIGV4dGVybmFsIGNvbm5lY3Rpdml0eSBvbiBlbmRwb2ludCBlIGNz
LUdyYXZpdG9uSURlY3NUYXNrRGVmQTJDQTdBNzYtNC13ZWItOWViOWFiYTA5NGVjY2FkYjEzMDAg
KGRiMTNkYzE5MzFkNWJlNzAyODRjYWM0ZGU2ODk5MjQ2MDM1ZGI4ZTVmOWUwY2Y5ZWUzNzczMDAw
ODAxYTcwYjApOiAoaXB0YWJsZXMgZmFpbGVkOiBpcHRhIGJsZXMgLS13YWl0IC10IG5hdCAtQSBE
T0NLRVIgLXAgdGNwIC1kIDAvMCAtLWRwb3J0IDgwODAgLWogRE5BVCAtLXRvLWRlc3RpbmF0aW9u
IDE3Mi4xNy4wLjI6MzAwMCAhIC1pIGRvY2tlcjA6IGlwdGFibGVzIHYxLjguNyAobGVnYWN5KTog
dW5rbm93biBvcHRpbyBuIFwiLS10by1kZXN0aW5hdGlvblwiXG5UcnkgYGlwdGFibGVzIC1oJyBv
ciAnaXB0YWJsZXMgLS1oZWxwJyBmb3IgbW9yZSBpbmZvcm1hdGlvbi5cbiAoZXhpdCBzdGF0dXMg
MikpLCBLbm93biBTZW50OiBOT05FXSBzZW50OiBmYWxzZSIgbW9kdWxlPXRhc2tfaGEgbmRsZXJf
dHlwZXMuZ28NCiAgICA+DQogICAgPiBQb3NzaWJseSBsaW5rZWQgdG8gdGhpcyBpc3N1ZSBhbmQg
bmZ0YWJsZXMgc3VwcG9ydD8gaHR0cHM6Ly9naXRodWIuY29tL21vYnkvbW9ieS9pc3N1ZXMvMzgw
OTkNCiAgICA+DQogICAgPiBBbnkgaWRlYXMgZm9yIHdvcmthcm91bmRzIHdvdWxkIGJlIHZlcnkg
bXVjaCBhcHByZWNpYXRlZCENCg0KICAgIEl0J3MgeW91ciBrZXJuZWwgY29uZmlndXJhdGlvbiwg
Y291cGxlZCB3aXRoIHRoZSBpcHRhYmxlcyBtb2R1bGVzDQogICAgYXZhaWxhYmxlIC4uIGJ1dCBt
b3N0IG9mdGVuLCBpdCBpcyBhIG1pc3Npbmcga2VybmVsIG1vZHVsZS4NCg0KICAgIFNvIHdpdGhv
dXQga25vd2luZyBleGFjdGx5IHdoYXQga2VybmVsIGFuZCBoYXJkd2FyZSB5b3UgYXJlIHJ1bm5p
bmcsDQogICAgaXQgaXMgaGFyZCB0byBzYXkgbW9yZS4NCg0KICAgIEJydWNlDQoNCiAgICA+DQog
ICAgPg0KICAgID4gDQogICAgPg0KDQoNCiAgICAtLQ0KICAgIC0gVGhvdSBzaGFsdCBub3QgZm9s
bG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdA0KICAgIHRo
ZWUgYXQgaXRzIGVuZA0KICAgIC0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3Rh
ciBUcmVrIElJDQoNCgoKCkFtYXpvbiBXZWIgU2VydmljZXMgRU1FQSBTQVJMLCAzOCBhdmVudWUg
Sm9obiBGLiBLZW5uZWR5LCBMLTE4NTUgTHV4ZW1ib3VyZywgUi5DLlMuIEx1eGVtYm91cmcgQjE4
NjI4NAoKQW1hem9uIFdlYiBTZXJ2aWNlcyBFTUVBIFNhcmwsIFVLIEJyYW5jaCwgMSBQcmluY2lw
YWwgUGxhY2UsIFdvcnNoaXAgU3RyZWV0LCBMb25kb24sIEVDMkEgMkZBLCBVbml0ZWQgS2luZ2Rv
bSwgcmVnaXN0ZXJlZCBpbiBFbmdsYW5kIGFuZCBXYWxlcywgVUsgRXN0YWJsaXNobWVudCBOby4g
QlIwMTkzMTUKCgo=
