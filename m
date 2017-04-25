Return-Path: <chunrong.guo@nxp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04F55E00AF4; Tue, 25 Apr 2017 01:31:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.32.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 1888 seconds by postgrey-1.32 at yocto-www;
	Tue, 25 Apr 2017 01:31:41 PDT
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0109.outbound.protection.outlook.com [104.47.32.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80122E00AE4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 01:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=5QCXn1EQ6LA8oitYSPadWZTFC38w9sB8RghVNazvhqU=;
	b=hMSLdxQbJ7LU6s5P8mlTn3DDzBcuB7fQjT5Mw8auBm/Pykal14rYDGYiynHEFhSv90JQKumDAx8v46Y5ZSRDNKouHHMKib4hZ58QWX3/U8F6D4M1aseX4YXD+Go7HjUf8IvVIv+nA/WWFeMx7rtJ0NLzV2qqTiYcYxgqgOzA2Tk=
Received: from BN6PR03CA0033.namprd03.prod.outlook.com (10.175.124.19) by
	CY1PR03MB1454.namprd03.prod.outlook.com (10.163.17.151) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.13; Tue, 25 Apr 2017 08:00:10 +0000
Received: from BY2FFO11FD016.protection.gbl (2a01:111:f400:7c0c::118) by
	BN6PR03CA0033.outlook.office365.com (2603:10b6:404:10c::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1047.13 via
	Frontend Transport; Tue, 25 Apr 2017 08:00:10 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD016.mail.protection.outlook.com (10.1.14.148) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1047.9
	via Frontend Transport; Tue, 25 Apr 2017 08:00:09 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v3P806bp025568; Tue, 25 Apr 2017 01:00:07 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 25 Apr 2017 15:59:59 +0800
Message-ID: <1493107201-29291-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(39850400002)(39400400002)(39410400002)(39840400002)(39450400003)(2980300002)(189002)(199003)(9170700003)(50986999)(53936002)(8656002)(2351001)(106466001)(104016004)(105586002)(54906002)(4326008)(48376002)(8676002)(50226002)(81166006)(77096006)(50466002)(8936002)(189998001)(2906002)(356003)(36756003)(6916009)(5003940100001)(6666003)(110136004)(5660300001)(47776003)(305945005)(38730400002)(42882006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR03MB1454;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:sfv; MX:1;
	A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD016;
	1:vco/bt0ZcwHLxg4yh1zm3VGdDWx9Hj+3BoixNQVuJNrI6IOO8wJQT2481XSaXm+nXtczqUaNIwoAge3wB4hRoh6YMWkt3OWrkn/xTJp1UD5eeFRrSMnLza5nhUNtDz6r7EthliXZuxXyoB2FzhhSWoib3v1uxKq+ldlLYSK2jf97hLpB5K8hvfs6Wjp/0Qm2Zmh2mXUXhdthZD/TGFBV7SRKgHA/Krn20D8sGQKqZPkjim/jh5Y/JcPsTl56uXVp5xZ5BlsHlyM0xO4OirKgIENVsSN3Yuiy0mHxV9o5WfD/Ut697dfwt7l66sKQfmsvNDjhfNdqxuduiYC1plgq0GsbRZzHhEaN7LWbr5IAnmFjIOIxOv3A374BpVQ4oyf8U8u6hXM8c3k7FAGLOcJ7OK9v7HwCqppZUnS7eVJOe6kFlQuhsaHaUKsnTgrbrPtP8VEU86B9hKbyxDvTjyFINXpFRgssjRSgvivKHcRq1E8iA3maC1vEXUJKEuv+cOKox2QGcu5MayTleeybkPzECbQ/+QP5da7thJkIZDL4T7yKvfLd2z3DXTalcYAk1x5Sj4mZuQoCmpLETaQeCWqk3g==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0683cf23-fec4-4d17-4143-08d48bb11826
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:CY1PR03MB1454; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1454;
	3:1k6kkc+F6R9OVrKbCnFvHxERtHL5IXC50+LXQExn2BvN+yM4HdLBr22GeLNGFdgTBN8e1Ko0j143X6QW3xyh9rCfUGJzC2fBJxPnSkTlydOAOr2Q2z3xsYRGy0NFlY1mFhYNfHDBsczagkpHC3THy20JZhNfaUUuMYubu9Ou3HsviY3lWNq0XEcT2yHZcbt6HrGj4Hf3Sfxs3wtoLNdwShoiYedvNfYdrA67THa0I7AALEzhHB/8WHMJf3oedmq7pDkTAgUYDZyDXWIUSW9Wl2OMfzr59ACPQGriQuFKS+y+57+CkrhYaN/t0GYkx0HQCT3a3tK3Uzq4CGQ4t6/ZjoU+7nM84oesD/Xcad3UcG08C14IQb2ao5E72R+IMOnT4kV08U5fiVC9yhuzV0VpO15sLkjIXGuh3gMkAHccjtHxvdenKR5U2yCdANp4+X+VDJUCtM6rO04zPDwqFtaLcyidWL2rbQNJI09zfSjXuvPRb9S+07E4fvBAJaqG4WXZ
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1454;
	25:lFyg7Fqnp8muR69gs4elETC+DADhd0ZkdQL2niQzqEf2i6FoDCnby+87IiJCCq6Z3wjJ/gwjfBEw5IFtyVY0TRO+ZcP+L3pcjFX0m0dYqgzs71PCX7cVzPhoWKHdClNkFBxDcUbfbaR9Ir0nQBMgjkU5+7EdagXnDVehZ//y72FpWVxe4uFOzSAbRs9+g9FzDcc3H+1nzMmq2b6w6cjw6o8usX7/vGAlOUKnOSEYpQembm85KVeOjH4fu3LARGQO+tFh7/AJR6yiifEfkxk3CrcOr6K58ecaEo8IE0vs0EV1zyKOk2jHImpGHyEC35sy0o91qBoGPgFoeEhOQ1zIdbjQXo+m65tJEUs0HrgCskK7moUdB541MeCUFMjCtF54upePO4Z1wQynAAAvjFyWWnckvP3Wv6WezRt8omaJBzSXJHXZx0m2SEboHkX5ObHvuL5E8J4WqowojbpkKQJbZg==;
	31:ykaCZQwejI7kMui4OMle5b/DFY5av4kn/lsjPoOQbUDzMSQRV40VX8+5jauK9KzEkZ5pmbmTzwoF8EWgLnniZ4BUn+mwO6qwF4fEpu8kxD9t0IBjMc37Nul0LusRb+q7vNrY+7rpqKIguUYDi7ILjv9HPWc9UUp/0G8EtrTwvaFqMJltVreUtV4LxwD01IRtCzCo2uL2wpbrr+iHutKQtmzwhURhD2sLc2LT8pHOa4Me+lttInpxbnq+9KsXOiBX
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1454;
	20:6B3nqVsH1zfGuY0xl9moa98vuF18S/kxhbYxIjuEdkeCuIfoHCbnTkEvMihfJQ9bDjPpC05xb0nZVYWVrelBpfwqM4suT9LOqWWq8ocChMnNcYRGVQF8F/LbuQICqZZR7lDmVEj+xqhtsSmoGHMV+U2xF4k/MtmZ6DykHrZBZ5I5z5ZJy8QS4+z/yC3oT/7NCylRbL8UWZw1/48yVRnAKFE/IadFJ1yOFB+htlHOMi3/CdV2snoYXR0xdxXLTTadG4TlAJzMI6D0LtIaVc2aEZDyTsBQZtaODJTJHvTXfleGQxcUkKdQvw4YzOjgSW/LAWzalGpPxZSznZF3YIlm0az2q5AkQT8rbUlH9r/4Ce6JL2s5f0/b38pOcccB/Rnev5n3dARGVbZCvsJ+vv50hyjspCfgYCN4vjJpzqK5gwqr2h1RJyjW2KZ204D2craIyPPDXQi04i1FP8AoPUo0dBomB1rxFv3+l3mDiJ0R3BnoqP5F+ZS1HjqXBOIi/q1BWwZcT0nrIM/X4tMlHnY51W/hk69zBc1rKxO2PurQTWk9AcKfC58w2HLZ8ArqyGNyL+/k+E+xb8sGZ7MHAnJLTGddsFMN015p1fs50/VKSWs=
X-Microsoft-Antispam-PRVS: <CY1PR03MB145494CFCADFCB6C51279B8B841E0@CY1PR03MB1454.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(13015025)(8121501046)(5005006)(13017025)(13018025)(13024025)(13023025)(93006095)(10201501046)(3002001)(6055026)(6041248)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(6072148);
	SRVR:CY1PR03MB1454; BCL:0; PCL:0; RULEID:; SRVR:CY1PR03MB1454; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1454;
	4:MTiu+l1h5ywTuebRAuaU6/TJPtGsTvDU3yj+kKP0+cJH9O2xAW/3qjdjhkqiDrbDdYNk7Dhhy2CPvITBnQIe+hU214CDwHYZ9EN/SVF8qWZlCWkoOwqgBZ+LVTLX680gDKSJLJoTXO96rsLvJPl1ln683kRFTDpKOdbxVSSLqUDmkuplLVEtsPrBy9rymXadnuFtctOzaLzjBbdAu73dAfhuGix5RjWkvfq0NckeqE+TO6DNxg5v3L1+PGVqgrKQ0wg3zBezHoxumNlLFOzRFtS40OtLanRfNF3tGJaDju86yDm7fVviXa5ZGX8yorst2Zd6TbO4VIetTZlF3Vx/r2dHX/FZRkpHrFmJJzH0nTdBisdpsBzUTtqafmOj8mpeKE2eMWifPjqYOTJ8rizWMudDqEqrqJRb8FOGHqRGH4WGxOxMAGEyC2QU8OezVXPQ7KiRKaORG5aD8nszFXuBExGgAP8zg0Nd3ejrhPg8yWbR2k5nbLbVMPtl8mAn6wX6yldHcj/9NQELorKuOUO8Q/+oBjZ3tKhXvYSvxYRH7PABGMhcvzKM2rMoZpjFz55ue4ThlzT1cYXtthY9NqZsP7U46UT1k2v6mBQNrbbt2w2Ow5YbU9nhkPHUaugBb4l20iZU6M42CIsCia2nnXobiMWpRHfrMIS+OtFXyuhLuG2IoyzTtffs2dDF6di+uHZaIC0IH4vFmpkNT2K80POAbvaw9YO0gwjo0KMTHcYn++mEUZHJWBx1pB4/TiWjKgyqeUmDyhl2fKcUSL04RqiFsUaqCeQAge6x0uvqBY7OQIs//sdd7WV17mRqHDlUf5th+nEWj9vhEQMGF9Xz83t2Za1TJQ6IRXsM96UU7bszkU4=
X-Forefront-PRVS: 0288CD37D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR03MB1454;
	23:wKo1JT5YyCdipGTr1UNV2NVQNKO1cRM725scjwVZo?=
	=?us-ascii?Q?sKus0p/hH9BAj7kjDvNSN+FB6d9/HMo5XRPyyW3WLQvFb6SQi1zbjsCxmlL4?=
	=?us-ascii?Q?TzV46Gp/UP+kEMh6APyHhputSQN0ILfBphoaXLunu7eqOkeudVaj3kkhDmYD?=
	=?us-ascii?Q?VTI50Azc+poMDfMvAesuXO9lVmi9nsZ5VB99QZqP+DnbheG9Qjlmrfqlldog?=
	=?us-ascii?Q?MsEL4JrtBySjFoHqJeG8ZbYdLgGGqa8ump2u8p65/ME+0G0kQlOHJH4Ck8si?=
	=?us-ascii?Q?hsK4tq+tdPGSHYcoU6NgvAU83/y95QoT+m/+Ozw5aFgv+BEWP2tNWhsPQnlv?=
	=?us-ascii?Q?QQIoc+TZbAFDWCIKSJfCeZi73ACBeLNDJtbM39ys4Kr5VRTDiYbrf08Jx7RM?=
	=?us-ascii?Q?Vi4m/6CxpwOmDgTPXtgRJ1/hT8ryeKy+fydS8pHrSdpwvdoW5seIlmD+VrPg?=
	=?us-ascii?Q?Rosu4avJUcanOz4eHxTrvK6lHb+rXjWiPaeDFsj3pTQHu2No03hLUgoxrlvD?=
	=?us-ascii?Q?l9Zy4ul+XvXxQqMj765yMFAXavxB+AdWdexj/Oe1YSPeiFXV3tbCXgKJgxFi?=
	=?us-ascii?Q?C4gB80IavIhHRAj0sxpJ8Nr2IfJYIWRRwCgVN8mmq+Z4vtGuhDYI8d2Nterc?=
	=?us-ascii?Q?t0A0/mm87VMwMuzqDCjXmdd/Cf6H4lh7/7XpMRzJQzHYnFxkSyQbU2t9S6x7?=
	=?us-ascii?Q?LhMbtTOho6oQQQYlazpXMh/fcs8E26yjlu/dbIVvbKUvlJJrWMAijypxJG6X?=
	=?us-ascii?Q?ykwcHf9PlOrjxLqK9Fe1WbOvKDZtZzrUr37b5aa4cLOCoWspZRt/RLNWGK2q?=
	=?us-ascii?Q?qxr+ZAtU4siDzqdv57iUSrLoVzAKpNVEa/tBRjc4rQEgfBsqX9BWuwYSygep?=
	=?us-ascii?Q?OT1XYlCU5hBU1tnJkuhWxoDrrLdyFNDeSsYqRqaaAJ+8HNoijADon6wD+oOh?=
	=?us-ascii?Q?lfFFe6yVft5Y+gY5l4phJOub+K/gE3g/tXWTRAUog8o9dsgXh2YIDVos4Uzg?=
	=?us-ascii?Q?8EnmxCouU+br7wIJFnapk2e?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1454;
	6:Y3WxgT++YdobjcOXUIfrzfRbTZjabri6ozVqrx7KaBxLjNC97j1cVkI93h4OagIZizBWQfuZ0uIw7J3nu6DZGoXk1LoKZV2aZrymH9snIsjbf0dpZmHOYBJO9MeOxQyrr3ioQx9BPg+he/eD+jJ16e18qL71cuzBlublOUx636VLR+TXE125Wnj3eOPtfhajyqHMJwpX9y1sp5lHijo97PQXSJY+9negtLj7bwbvRYJtQaJJ9LEgJeFePVjLnYPP0pk56zWlfzFxaj/EFhj51QzZvVndomcDAuHc53qIZrYyG7nDzHEEZLAUJju/X7Y730lpBDJKcnirDFQwLZA7o4zbW85rrdUinwCucZS15/5NRDvtcYBSYB4P3vgL1n16w0HRrZe9L7mp9tBu4J8nURHHQcuFCrq/sAIFmw4kcPRIGoHqoPnVHYyXUmL6NuSqcKLgcAjcKN9L4r39FLbZ6hoqxy27VDHBnk/01w736MttxdEDlx7sP6/f1zFa/UFz/2dW6gcU4Wf8OIFToGKz+gwTLbfkM+VhHOZVzN83ItI=;
	5:gqbakB6W0w5gMn0EeYEyj8LU3V3sqn+w6LwrwMOE/QFefJCnHi0Ekhy8WLmKgLrhO38uQWQzfRh1GqT4o4Pi1ioBUe/3cYJNix604/ZIdup+Vp3SJS/Al4H/eMmqgXMcja8IAKECBnxVBS0bWV9cAw==;
	24:Ca1B9ErxEdp+0IU41v9cEfTKwvSCViPo+FItH87IFa1pxfap0bl9L3ycOtWahObX9CxZf5xK3KSRFUKJ912CyS/zxRI37137gNGF3YNKei4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1454;
	7:NrADKdZ766I4gju7XU1ckkrLz7GB/zF/zeCM7T0cxyo+vGA2bLe+2gae5PQ8KfI1fMud8H4zXIqMx8bg6uFcOVXcyJpX/wtsWQFAy24tl9s4WUxOKJw25FEzR8jjFfTD8YdBMRpK4RUcegbYRxAWV1URX/kqGl82MUzXOdGugZP3GSMix+OK7GMHGki1/EFebBc5cITkF58iIvtrzwAlz9HxXYlQr7Wd6jaH1YkOJ3HNgkYVZ7AKVAPi9N/opc1/Zx3mzFe/YUSztm3pEUeZsHedTEbficJSOHDreVp6FvFmn+ol8xtkWNqHuJMXlzZOafPrzOKsbseCSyq6EtFTYg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2017 08:00:09.4687 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB1454
Cc: chunrong.guo@nxp.com
Subject: [PATCH 1/3] packagegroup-docker:initial add
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Apr 2017 08:31:44 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

---
 recipes-containers/packagegroups/packagegroup-docker.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-containers/packagegroups/packagegroup-docker.bb

diff --git a/recipes-containers/packagegroups/packagegroup-docker.bb b/recipes-containers/packagegroups/packagegroup-docker.bb
new file mode 100644
index 0000000..8ac7600
--- /dev/null
+++ b/recipes-containers/packagegroups/packagegroup-docker.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Install docker tools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+PACKAGES = "${PN}"
+
+RDEPENDS_${PN} = "docker \
+    docker-registry  \
+" 
-- 
1.9.0


