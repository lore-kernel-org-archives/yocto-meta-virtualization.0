Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.60])
 by mx.groups.io with SMTP id smtpd.web11.13830.1586955421772105379
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 05:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=G5uvzKVP;
 spf=pass (domain: windriver.com, ip: 40.107.220.60, mailfrom: mark.asselstine@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fus2K38In/Xlfb1T4ca6rcKqFusdiNOS0GIRjjtjejMg3qGNEzgiLJ9rt7YRBdkal3khrPKJVUiJQOL1qsw6d4KmVT47Q3ZHqfY5MhN/OGi3HKtfLgRza6K4Xv6uG1hTqZFkKKEScpNRkT/10HHZ53fHHzSENKk5tF+w33gCxBBYnZJNL4X9M5LOrFozeJVfoNuUErZcgvPwMSl+SkHBR0w6L1KTMqd15xFxqbtrnMEZhOhFocoEDa1C8gwpMeAHUy8krHTCjy4NiB6blZ7LVWRS+VEGwwF7otl47YVbC8S1hfA/zPbJBQqhpO9LGMTBF99OSBocl9AeIu55SoQ3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNk/GfQwnynN3+07amwIF52SDLYfijqn2A8LRkd3NFU=;
 b=FPWTBSCDl3578F/Dk8AyGklkEbgywEwzwUqXRY5qEHYFrac6XuvXuj0TjhTKZ4ArOWrfPw+Q5N9qcf4zy/Ekx7S/hpaOO6z8+YQi1RmlLUaCOPjr0Apnrd3eS6Gl6Iz/50d3OsBecgZDqF+5YrSEtq1VY+8P3ET2M/SPlBILis1YlbplWis4eUJu29fLQdTqCpHnl6FeMaGU3HrLxgKd9nPwUHbDTvBhaPCTxH4j4eKDPttnNTJ5wH5/og53WB8qBu1qoJIXQJqJMCbJJU7oDcT4DDvs1Y6wIQPXjXJjS1D3CB5LEpCoN/VD28GSQDWtKNL6sNLHI8pjtRW0yg1Ycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNk/GfQwnynN3+07amwIF52SDLYfijqn2A8LRkd3NFU=;
 b=G5uvzKVPK78m0S6LcYYc0CYzEySIvg3snpcpF9UUyu88pY2BsCPKvMYI6XWrO57SmA5ffKKpYOB1ryq7V0M07nEQ6QuR94XhTUIB/LIXQy3YJzJz9XE3LKjq0R1PIB0yELxVkmOPchtK4cD1Jp7c0rK+roV1DYxBPmN3isJAIFY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mark.Asselstine@windriver.com; 
Received: from DM6PR11MB2553.namprd11.prod.outlook.com (2603:10b6:5:bf::32) by
 DM6PR11MB4106.namprd11.prod.outlook.com (2603:10b6:5:19f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.26; Wed, 15 Apr 2020 12:57:00 +0000
Received: from DM6PR11MB2553.namprd11.prod.outlook.com
 ([fe80::54f3:93c:2625:aa13]) by DM6PR11MB2553.namprd11.prod.outlook.com
 ([fe80::54f3:93c:2625:aa13%7]) with mapi id 15.20.2921.024; Wed, 15 Apr 2020
 12:56:59 +0000
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: =?ISO-8859-1?Q?=C9loi?= Bail <eloi.bail@savoirfairelinux.com>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] Openvswitch 2.13 and python3
Date: Wed, 15 Apr 2020 08:56:57 -0400
Message-ID: <5905951.Fl0HmE6k0P@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <607097091.1083838.1586933157275.JavaMail.zimbra@savoirfairelinux.com>
References: <1728619179.807474.1586271464336.JavaMail.zimbra@savoirfairelinux.com> <CAPuovEKCBbp5a58z4S80VN3HNLbz_jMNwKdVLoCs=FJurSaypQ@mail.gmail.com> <607097091.1083838.1586933157275.JavaMail.zimbra@savoirfairelinux.com>
X-ClientProxiedBy: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To DM6PR11MB2553.namprd11.prod.outlook.com
 (2603:10b6:5:bf::32)
Return-Path: mark.asselstine@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-masselst-lx1.localnet (198.84.181.245) by YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Wed, 15 Apr 2020 12:56:59 +0000
X-Originating-IP: [198.84.181.245]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74ba596b-f66d-43b0-566d-08d7e13c7c5d
X-MS-TrafficTypeDiagnostic: DM6PR11MB4106:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB41065471104721147E52D1D6EDDB0@DM6PR11MB4106.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0374433C81
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2553.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(376002)(346002)(39850400004)(396003)(136003)(366004)(6916009)(53546011)(81156014)(36916002)(66574012)(26005)(66476007)(6512007)(8676002)(5660300002)(86362001)(66556008)(186003)(9686003)(478600001)(8936002)(44832011)(316002)(16526019)(6506007)(33716001)(52116002)(6486002)(66946007)(956004)(966005)(2906002)(4326008)(39026012);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5FLNQNuePjkcp1fAPqFGwhYmtHAfJno5CkT/dOLpeyxao9NUhs960ObB/1dkztDj4v/s7AVcE/RUaiSs9m751iKiNn0O5l+H76x6ewBRQM6aEEaKzS1Gt02vpkTUG+UpjrSsYUOyP7TuWYadkSmazn7RY5y8mjvhGHeEzRlH87WK+wYdwiTrCxAMberQU152ehgzAwo+DYxn4CXfkWH+rA29d++7fwJLb+YT6/oqjVSLP4kAwYGNiDVa3phBNHDbhYWFbR1xcvZY8ch3HuE1t3vUZXN3RUDEGPWn6FvC/pqMawpR3AsAtiKberTJRWIjzkufVpKqIwWi/BmgWhGumna/TTmJzzxi7Q5ekvMohgKejI0cbH2tpq4ds8q3CHSdozD6FIQztU4lxxiRrDMsPjBCAEhzIPC62dGDQFP0CBAqGfWv/Wl1trEOOr0yldzaw9lKUbS6TrU9zruozXFGA86DezAfjSfTThbn3csEbRVbe7J4EoRQny7eC5hJRz9+nzFjxNQgJbHjdp9DKrSAN5ebi/bo1UiUC5ZvxR0gYzmdGlDOw1idvZDxfF+i/M5inWB/oQd9thdcKmHBlaiSAw==
X-MS-Exchange-AntiSpam-MessageData: 
	ycje6OwxaQj17SaEh0h6JC20JlEEBVZ/Qa7hK91z35Jk7817dT+kucvXbpKcAo5aXbPgGdIuYJ1rqlrZHMqyQjC+5Lu/N0Y9AS9053DopgZEv/eWs96Ct5qVqT1Xha7UEirath7BXJc+MOs3zY0ZKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ba596b-f66d-43b0-566d-08d7e13c7c5d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2020 12:56:59.8542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkRZz1AYkeOnDCHmJJMFSFapBgNMqYj7aAdVYed9towaNXgX3+beZU7xeeLQ5ZrT1uQF8vRDyqa2HV5hpkbXpwtp4WnGzG/mggSJW4WfA0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4106
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday, April 15, 2020 2:45:57 A.M. EDT =C9loi Bail wrote:
> > On Tue, Apr 7, 2020 at 10:57 AM =C9loi Bail
> >=20
> > <eloi.bail@savoirfairelinux.com> wrote:
> > > Hi guys,
> > >=20
> > > I am integrating ovs/dpdk on Yocto Zeus.
> >>=20
> >> As I am using a custom Linux Kernel 4.19, I can't use ovs 2.11 and use=
d
> >> the
> >>=20
> > > mainline version.
> >>=20
> >> FYI I struggled with EXTRA_OECONF to point to my Linux Kernel as
> >> mentionned in>>=20
> > > Openvswitch recipe.
> >>=20
> >> EXTRA_OECONF_append_pn-openvswitch needs to be used in distro instead =
of
> >>=20
> > > EXTRA_OECONF_pn-openvswitch +=3D
> > >=20
> > > Now my ovs/dpdk is correctly installed on my Yocto image.
> >>=20
> >> However, ovs utilities seem to have wrong shebang (#! python3). The
> >> shebang is>>=20
> >> based on PYTHON3 variable. For instance:
> > > https://github.com/openvswitch/ovs/blob/master/utilities/ovs-test.in#=
L1
> > > PYTHON3 variable is provided in EXTRA_OECONF from openvswitch.inc:
> > >=20
> > > EXTRA_OECONF +=3D "\
> > > PYTHON=3Dpython3 \
> > > PYTHON3=3Dpython3 \
> > > PERL=3D${bindir}/perl \
> > > "
> > >=20
> > > Did you encounter this issue ?
> >>=20
> >> Also, OVS utilities - including test tools - still use python2 syntax =
but
> >> Openvswitch recipe RDEPEND on python3 only. I don't know if it is a kn=
own
> >>=20
> > > issue.
> >>=20
> >> I know that some recent work on python3 migration was done by ovs team
> >> but
> >>=20
> > > AFAIK, utilities scripts would require some work.
> > > I will give a try to migrate those scripts with 2to3 tool.
> >=20
> > We switched to use Python3 exclusively with OVS for quite a while now.
> > With the Yocto Project being mostly used in embedded environments size
> > was the driving factor, having py2 and py3 present was not desirable.
> > With Python2 being EOL'd at this point I suspect the upstream OVS
> > community will soon remove any traces of python2 from the project.
> > There is no value in spending any time on py2 with OVS at this point.
> > The package will build and operate just fine as it is.
> >=20
> > Mark
>=20
> Hi Mark,
>=20
> I can't disagree with that. Python2 must be dropped ! The work needs to b=
e
> done on OVS side. I was just wondering if you were aware of the limitatio=
ns
> regarding the usage of python2 OVS test tools and if you had any feedback
> from OVS team.
>=20
> However, I believe that the shebang issue (set to #! python3) should be
> resolved in meta-virtualization. Did you also see this issue ?

We use OVS  extensively, for example as a VRF in meta-overc, and throughout=
=20
many telco type deployments, but by no means do we make use of every tool o=
r=20
part of the project. We have run into no issues or failures, outside of=20
ignoring the py2 test results. When we did first make the switch to py3 we =
did=20
send some changes upstream and they were receptive to moving to py3 as=20
default, even well before py2 EOL was even being discussed.

If you did run into issues I would suggest you try to upstream them or send=
=20
them to the list. If they are reasonable I am sure Bruce would have no issu=
e=20
hosting them on meta-virtualization.

Mark

>=20
> Eloi




