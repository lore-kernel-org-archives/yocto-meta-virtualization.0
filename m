Return-Path: <David.Antliff@Aviatnet.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 680C5E0096A; Thu,  2 Aug 2018 01:37:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.40.57 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 15498 seconds by postgrey-1.32 at yocto-www;
	Thu, 02 Aug 2018 01:37:33 PDT
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0057.outbound.protection.outlook.com [104.47.40.57])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D18B7E008CA
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Aug 2018 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aviatus.onmicrosoft.com; s=selector1-aviatnet-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+atfM2cqbAqGhECXOInzYDsgEo+6zHEHHnrMFQm4bKg=;
	b=e4D9NIsrJW6cZbrDPEvXaV4lljwzuiUzzWiLBhUncngz5bbVacdpsO0Bs4Z7TRPv1/QEzWN3IkUL6ALOuWbOYlOWEI9KKtMw6rmj7oEPKjeT431+x4iLVUXiHwOXznTGKzmAJ3o5mym54/eaQSTwerqCQWZ5GLTR5+l2Ttd0MNE=
Received: from BN6PR08CA0057.namprd08.prod.outlook.com (2603:10b6:404:b9::19)
	by BN3PR0801MB2195.namprd08.prod.outlook.com
	(2a01:111:e400:7bbe::10) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.995.20;
	Thu, 2 Aug 2018 04:04:32 +0000
Received: from DM3NAM03FT054.eop-NAM03.prod.protection.outlook.com
	(2a01:111:f400:7e49::203) by BN6PR08CA0057.outlook.office365.com
	(2603:10b6:404:b9::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1017.14 via
	Frontend Transport; Thu, 2 Aug 2018 04:04:32 +0000
Authentication-Results: spf=pass (sender IP is 192.147.115.54)
	smtp.mailfrom=Aviatnet.com; yoctoproject.org;
	dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=bestguesspass action=none
	header.from=Aviatnet.com;
Received-SPF: Pass (protection.outlook.com: domain of Aviatnet.com designates
	192.147.115.54 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.147.115.54; helo=mail-send.aviatnet.com;
Received: from mail-send.aviatnet.com (192.147.115.54) by
	DM3NAM03FT054.mail.protection.outlook.com (10.152.83.223) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.1038.3 via Frontend Transport; Thu, 2 Aug 2018 04:04:32 +0000
From: David Antliff <David.Antliff@Aviatnet.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Docker init script possibly uses wrong invocation?
Thread-Index: AQHUKhXo6Cn866I8f0uHfKAF2XgxhA==
Date: Thu, 2 Aug 2018 04:04:31 +0000
Message-ID: <1533182670806.88977@Aviatnet.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.15.6.10]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.147.115.54; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(396003)(346002)(376002)(136003)(39850400004)(2980300002)(438002)(199004)(189003)(126002)(2616005)(186003)(84326002)(30436002)(246002)(486006)(956004)(26005)(356003)(7696005)(2906002)(118246002)(72206003)(478600001)(5640700003)(6916009)(8676002)(476003)(86362001)(97876018)(316002)(53416004)(236005)(5660300001)(7736002)(16586007)(2351001)(106466001)(106002)(6116002)(36736006)(25786009)(2501003)(102836004)(966005)(7636002)(336012)(117636001)(8936002)(4546004)(606006)(36756003)(19627405001)(6486002)(54896002)(3846002)(6306002)(7596002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR0801MB2195;
	H:mail-send.aviatnet.com; FPR:; SPF:Pass; LANG:en;
	PTR:mail-send.aviatnet.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; DM3NAM03FT054;
	1:1uL5SJxCAJzT+5RQSxt6o6JrS35+W5Q82yChJ2PvnfiO6g0cuAOTUm0IDHUN29QjKGEjw06qkoUF8kLTHcYWH/2+y+JoHYEvXDXaNim7rzassuLkGQkpXympJlm0SVUW
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16fe893e-0f14-41e8-1c6d-08d5f82d0d59
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:BN3PR0801MB2195; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0801MB2195;
	3:LR2atHJQjN660qbGxtLbC2x0rQTL7QK3vRYzBB434kNl1aXfjnFH8SWcOZVJ2Q/P/AWfl6agWnv4QEejuMGJiMiyswSeMHpUwsGr282JwWxDeb4RO5Eust51XhKD3ePETLx9202DQBj64vY3wGCW2IdJz0Kd5yWIVcFYGwidhxG0HTlXN9jLAwiwle/YNln8OF7oiN0NHBanHCC4BJCG6REsR8dml6S+ehAGpmTVtSnmYH22jux9DdFezRW1ExF9nIO426LK17r56wT7oo4gR/DWaw3F8ni4vwxT3vzHrJ4XpbpJeHUWsx1rEwDtSOTRT7dvJbuBJidRwF3eFtELUWvfSGItpIDmP5fQRCgihkQ=;
	25:quTdK80Q5RikyqwZDFqYMzT/UotWBh1bpAMg+WTNczHO5io5LKjNh4hUD4BI20BDoh7PJDKVIaYweXI9oEgeBeupzgNouDwFuGReeL/70q2CnnQ6TsktoSczot+V8dpD+1NUrOoLqy1B5HTrrZ7qnwCBJcJR1GI9cuzDAdl9KVqZWuQpMGGyeSO3UMhIdbZO+qebDzbQs6U7fIEHAUlJR5B1wzXt4lI3Jygs/P5rLtP2cznKh4ujcfX0OPlVH+3T46OWNUaZjnfIaK3/1iygtrM0CbJsX3HUdqRZBtEgcTr4inRyC4iDytbTnJvvRjdBT3Gb/7HjRNjwD9o6j5buTw==
X-MS-TrafficTypeDiagnostic: BN3PR0801MB2195:
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0801MB2195;
	31:+Vk0YVDDhlJienfWLKkf+KWBi8ZCmgGxtsFKkw88MCdBwrehPchiQzh8JDE2jRoYTWDYHnjuffsISXNZs4+P4OxkRHpmXGhACLyzC9tL/ZqMOgKaPV1FqugtaU4bJE7Bop6zT0hUwChdw/2c9MS8btLNAqU2LZcN4IV2xff1kyAEhzWJdZjJ8v4Gk4ctCBLz9eL25nCKbOeVQVyhsufZ5VzRpWHLtr86HeLQ8m53X+I=;
	20:SyFcc/4ciMpP6oYUGEnNLma+rcKdtIXUQ/iWcUTJVyfA5+TvipeQ0IX28z2Y9xr0jfrqIEkzhq37iruQpW8WkX+dd1uLwdMy6t+zAGBbpAnhDB4oxaWR1/gIMF+4JOWbu+Xy6B1KNM8G1oWif9+M1pYHH3pn99s6RGQpWEpFVMmwa3NhRzppim6ptPkK3Wffa2zQfMM3OQ27bAP2kgh6dCKBqejca9t9DINo33hOVEZalrBNIRzn9OvkbrErXumHU3coEQ4Ul17UKlNw1M6bAoP511160ObAzM6EZmSdondQA2fqxxB0QJzPyS0jOpjDIcTmK/6BPnMYYd+U1ifqXpFmfQlD7JfICTLUvFurzic7ymIYq1bowfoh2kfNPxjRZ0aKfn01yodu+vj0dPeVYlwPPrHcUk9tpEw62Aj7u1NyIXCz3cTwX0YjfbylgkqA4CAI9jo6T4IO6vF2LfJgF2Rl6vz/mqJRNQXADbMN9iWOsiTZLPcdmcnxUnortUwm
X-Microsoft-Antispam-PRVS: <BN3PR0801MB2195649353F1451F8DA273478F2C0@BN3PR0801MB2195.namprd08.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231311)(944501410)(52105095)(93006095)(93004095)(10201501046)(3002001)(149027)(150027)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:BN3PR0801MB2195; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0801MB2195; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0801MB2195;
	4:LS1jdeFmxne3wb/x8hOnOXObL39BXlV8QIl2WlRvEINfuuYNPS0qexxcDhuCFgrq8Dra9+mk9MDzZWvEJnmFzwIT1Rnebxi3BiEVbdWX32CNB8/xxzvThaF9V28Inp6EGBclz5eXZoP26OcEUF7ksc3jOAKLLAdeN/8C5qVTXkg/2Tt+4aHG/wBpu8iaZd51+8XYSmB4UD2M6lMMi+a3G+H0/1Ffr3gQOBoUB2OHbdrHxOfog6pIQBri+x5jL7GDqT4/ai/gbmuM1okLI9msGA==
X-Forefront-PRVS: 07521929C1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0801MB2195;
	23:g5v0A0u41kHWkvWeDtwyesGnZHU7DNI2qheE0DA?=
	=?us-ascii?Q?EU7HbESdG7rPemvi7YiMg/N67AdTu4wGMz1rVFkJJfHoffjHCQjLiWc8VFr9?=
	=?us-ascii?Q?S2ARLCnE3/44jPH6w11kVcoNIJrTlXkCHxoU8CD1bfbMdGSeXk0PKL3hTNuk?=
	=?us-ascii?Q?Nkc0UbZf6O1vQWC3QuR6HJP8lZF7nNs5iKixn27/7e3lK7akCn9CtROGlO6D?=
	=?us-ascii?Q?LNPSQPQQDjo3Sv8nbHVyfiLyZAPrzew7uWD+EOeXNHAT+JMh3qXx1Dbhaz8M?=
	=?us-ascii?Q?Cpd+RuHgUXAs816QoXlR0WU2RJFRNEpGQOvH031vhITDLSj8oFfVUi/BIJwa?=
	=?us-ascii?Q?yA5IYlQiqv7OdqG1hvdgrhFG1zGyb61YYZg3gtAeq1w+xKZyQ10aNJz+d1a7?=
	=?us-ascii?Q?ybE4Foan3YoAOSH8XyRBvUdyfiDYmwanyYFDjvWAJkX3pD8GJvk3bd5TmnLq?=
	=?us-ascii?Q?10mCWvzGL7lFf0WUq/d6loNfqeaUlbFhKdNGKZvmWdmwWunvWbjaVPexfP9+?=
	=?us-ascii?Q?4B/3g/WI1lnWAh4W9a6RZtCg9aluVGh05DnNYG0gnAE0xBUJ6I0b5MbXdFd/?=
	=?us-ascii?Q?ZKD4Wu5XITGyYQv9O7M5Mbhcf0dhSTxSQ296wAep5pzQFobKwWuA8Expx0Lv?=
	=?us-ascii?Q?xf9TgUfcYMIzSg61PJq61HJ8IjDVidULtlk4799FtZ6hn2UYXdpFYjMAnmWY?=
	=?us-ascii?Q?mLpUuMHp+8HIFDMgR+0v7B4vwImr2Net9Fvh3denyXl8iOSMXuHbeBi+rLGS?=
	=?us-ascii?Q?f3jd+gcTI5tu8h+Xyuy3kktU5hz379SDZOleaSFOBv7ibwLvzETAG+VpLAzk?=
	=?us-ascii?Q?VpGd5GKDzqHk3NzRp1OUG0Vg3Uv1PaYEiBbcVuJf2C9WL+LzATKV8b042t68?=
	=?us-ascii?Q?rIKafZXzpCuVp8vKkmTM9NFLAbZ7U3bR8ZK0kb0O7tddiLy4WhhIuhulAzZv?=
	=?us-ascii?Q?nPftV9i/ZTRC5Zi55x3OSa0k9s5NXvpdQWbhNjy6BAqntifPqLpUnvB2lWRe?=
	=?us-ascii?Q?gEq5YPK11vgfCCKAb7iYWi3OmPS08hDqRWGrQwRzLNbf6a6OtINI/BicU408?=
	=?us-ascii?Q?eOn+36NDWBsoY6kDdBAwQZHqWNwgC0z3OMu03VSH2KS2QboXbqeMZsJnzqor?=
	=?us-ascii?Q?qpSWvFdLIUjGQhsEWi2k8st429tpx9PbkI1Jg2QhQeVp0bwytZlfnrQhGr6P?=
	=?us-ascii?Q?E9dKUym4ly4PnPdIdAlFmiYJBpjXfYvxOwFlr433HkBCfq5I/KfBuGmDwlsu?=
	=?us-ascii?Q?EV5aUn7tK1+y/ca5+Pcof6PiYd3SogUHxgiieIIwZnpKRN7Qw4MV+9PPirUo?=
	=?us-ascii?Q?U+Jz3VjScoqSrk1LNUveLUsfCoLCuzNy8bPrYj+V8uodfkVJIDJs+u/e6tJm?=
	=?us-ascii?Q?2n7HSBw=3D=3D?=
X-Microsoft-Antispam-Message-Info: xNsUJCFLQgflLepL6F3IwyDQr/DiWyjJzEh1lZfCIjsVj9X3xmjDNLpEy+AhMYOKG7hrogXGn35PFCoGIlFzMo5c2FHdsAJQ4dodPeVrfkWcgeGuhA/G0k9XR2n+EcHdUAgkwYxlTHMjyXrdFerQIoW8QbjGeBfgtsuab3nv/lxTONRCoMOucFOoABbk8zo0rJ/F0iShSZZelIZHIM0WDrRE7MTjqGjJuX4QLUdKvMSZwiN+IU7EkneU3gBkzKFS/eKOI6/uBX9UlJ6gJn6tKm8tbb2LkGguckp5EqMEJcJ9YBxx2P9arKYFcxpsFhkNAjfby9E8gk+srVbjbDLY73+fTs+oNpXtnTbexsreqjQ=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0801MB2195;
	6:5uo8vmyvMzJPvFCDIljNK428+sKJrnIEzktHEUQZQfbkeKu15hUAEJQoD6y1QRFuD1n48vbfchiKv6F81ilI2LuZl0xtOOro4q+dicxOI8FYe+wNZvZuEElLT7At0FvgH8S5BmmKww24sHzQ4E3qKOlg6ie6uiMv4rSJsVDCgVm+Ueqx+pxHFfwLUsKI0fsW/hyII+8XBDUOPu9NE8j/TM90XBWI689pGxJC+dROVbUTIZZYvyewsGegpPM6iYvCUxWiomEdFYkjP3bai66I5HfNAUSul/RIvTPY0aEHuT4Rd+dtfzgijTTuWHIwMXDakY5ipAw0ilbvvErsW6kpLb9bXHfz8vLHxNGhrXbmJLNKu5BnuilvfpC5YLoxPtKXS7f3Hv5ykdHNNkVoRkfyQM5+mjQUpUno2IJOJMA2MpCaYDUg+1u0Hvq+QGNViw/LuuEdEXXsyTPQ24L8YLxMKg==;
	5:OKAmPG8/2TpBqlzDZDIILgvuRMg/iEyn94lJCKTzsCYBWvRvp+pI3n9AlRkpUCvWxxTNlbYWxTidFD3YvrggsRifKMhQtuMcQFOnQxY1czBBnIZnkcIyD1CBqgXZLBW/1TO84MTsX18aHYyamBQ5fW1wIlHifiB2wqYMVrEa9FA=;
	7:5LejfynKd1obyIkiGOVYi/f9f13xrl85Bj1OpQDLQ2xCQN752ak0HNheZdhaVL8l7C3WA9QfdKcpuDxQxl1qrJWsWtRyALIkeERu8lOJvk4KPgdlTsB/khZVa/JC62kCv0sPfS9g3nySey1TBAjdbDP3iIn4YOCdLCd67/ESELNmJikzIaUmUhLc37VufNh9S+XQ0/bbTaVxPXL+iMHJRtiIhdJWEDBQtH22romaxr35U8Yv9tMsZdgj967PHDcD
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: aviatnet.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2018 04:04:32.2703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fe893e-0f14-41e8-1c6d-08d5f82d0d59
X-MS-Exchange-CrossTenant-Id: 8d7d22b9-3890-4eef-95a6-a226e64151be
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=8d7d22b9-3890-4eef-95a6-a226e64151be;
	Ip=[192.147.115.54]; Helo=[mail-send.aviatnet.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0801MB2195
Subject: Docker init script possibly uses wrong invocation?
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
X-List-Received-Date: Thu, 02 Aug 2018 08:37:36 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_153318267080688977Aviatnetcom_"

--_000_153318267080688977Aviatnetcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I've installed the "docker" (docker_git.bb) recipe in my ARM64 yocto image,=
 from meta-virtualization 1e67a44 (24 July).


I note that it installed /etc/init.d/docker.init, however this fails to sta=
rt the daemon.


The script runs `/usr/bin/docker daemon ...` however this command is not re=
cognised by this program:


# /usr/bin/docker daemon
docker: 'daemon' is not a docker command.

Instead, /usr/bin/dockerd run manually seems to do something more useful:
?
# /usr/bin/dockerd
INFO[2018-08-02T04:05:04.144036840Z] libcontainerd: started new docker-cont=
ainerd process  pid=3D4643
INFO[0000] starting containerd                           module=3Dcontainer=
d revision=3Dcfd04396dc68220d1cecbe686a6cc3aa5ce3667c.m version=3Dv1.0.2.m
...

I've noticed that docker.service also uses this invocation:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes=
-containers/docker/files/docker.service

This makes me wonder if I've misconfigured something, or am I unlucky in my=
 timing such that docker-from-git has changed its behaviour in this area ve=
ry recently?

--
David.






--_000_153318267080688977Aviatnetcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>I've installed the &quot;docker&quot; (docker_git.bb) recipe in my ARM64=
 yocto image, from meta-virtualization&nbsp;1e67a44 (24 July).<br>
</p>
<p><br>
</p>
<p>I note that it installed /etc/init.d/docker.init, however this fails to =
start the daemon.<br>
</p>
<p><br>
</p>
<p>The script runs `/usr/bin/docker daemon ...` however this command&nbsp;i=
s not recognised by this program:<br>
</p>
<p><br>
</p>
<div># /usr/bin/docker daemon</div>
<div>docker: 'daemon' is not a docker command.</div>
<div><br>
Instead, /usr/bin/dockerd run manually&nbsp;seems to do something more usef=
ul:</div>
<div>&#8203;
<div># /usr/bin/dockerd&nbsp; &nbsp; &nbsp; &nbsp;</div>
<div>INFO[2018-08-02T04:05:04.144036840Z] libcontainerd: started new docker=
-containerd process&nbsp; pid=3D4643</div>
<div>INFO[0000] starting containerd&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;module=3Dcontainer=
d revision=3Dcfd04396dc68220d1cecbe686a6cc3aa5ce3667c.m version=3Dv1.0.2.m<=
/div>
<div>...</div>
<div><br>
</div>
<div>I've noticed that docker.service also uses this invocation:<br>
</div>
<div><br>
</div>
<div><a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizat=
ion/tree/recipes-containers/docker/files/docker.service">https://git.yoctop=
roject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/docker=
/files/docker.service</a><br>
</div>
<div><br>
</div>
<div>This makes me wonder if I've misconfigured something, or am I unlucky =
in my timing such&nbsp;that docker-from-git has changed its behaviour in th=
is area very recently?<br>
</div>
<div><br>
</div>
<div>--&nbsp;</div>
<div>David.<br>
</div>
<div><br>
</div>
<div><br>
<br>
</div>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_153318267080688977Aviatnetcom_--
