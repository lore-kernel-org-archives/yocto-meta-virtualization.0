Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web09.8084.1634640668355550650
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 03:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=m4Cb80o+;
 spf=pass (domain: arm.com, ip: 40.107.22.45, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bN5XIQVxBr9CK3zlwsjwVJJpDqWnZ5+W7R1H4xnaik=;
 b=m4Cb80o+Ej1QaMJAyeW7mm0ynH3QhTn5ZlVhVPHT4dctdMNaEgabeYc8XSDZXtjPvZbrLtLWqaWzipB03666UhJ5yZD6U6Pln3RXWM7+ssZdmRvIXjpSL1pOHiS2b226zHjzRT9DI1wQSm07W7tQTxanw25JFL8bNdDX1GueDng=
Received: from DB8PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:10:100::24)
 by DB8PR08MB4153.eurprd08.prod.outlook.com (2603:10a6:10:a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 10:50:58 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::cc) by DB8PR06CA0011.outlook.office365.com
 (2603:10a6:10:100::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 10:50:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 10:50:58 +0000
Received: ("Tessian outbound 8e26f7114b75:v103"); Tue, 19 Oct 2021 10:50:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bfb9d1dfa69e596
X-CR-MTA-TID: 64aa7808
Received: from d703aa816aac.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2CA49D0D-7A89-4D4A-B07C-0523520C8D12.1;
	Tue, 19 Oct 2021 10:50:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d703aa816aac.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 Oct 2021 10:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWjQ2aoRD0FW3maoIdWU7cMSFrVNxa6WoepAthKLsPrZ+M4kh5+tNdgouotTFrSpF5l5zfsKkcKQYRPfskqSACmeBTMHqkodxWo4kzRCOpuXaizCYLtXbGicsxvJFR1nWI+/Y4WFHmb3DmjU42jZJkCYcycDBslE4R1GFcDauVWWTa3H3FTBLd7d+f1Ue3RVRUEXB1SrNsQiMjKyHlG/qN/ob5UuL+TG08NAEWu4/8aWZszSlOWF/cdIfQQhXD89oWHIXJKZ/wx2R6NuVzZbQLub1L+QHIxyMJcL5Oiko6Pg2VUoHEk32WiLRkov8lT/75RzQgU0m7CAqW4TJ+Wmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bN5XIQVxBr9CK3zlwsjwVJJpDqWnZ5+W7R1H4xnaik=;
 b=WNKTil3QjvSJmQJzdKVJMlsXvPA5gTeIYbKFtfixCzkkwbtE12MS29wySrufN3DD/Mrls9RN5gt5ffHMAjH9wzyE630mBsdtzSC9+YobixOVHou/p/uGZFqRef5Ye2jiSuqcRrLal9WzXCjYhy+CVMs1jWMF3tvPnQ7fH0EZSFuq1wmy4aJ6jAs6Ys7qC05sgVktBqk2LtPvGpOCTdFGG+99iwpRkS0G+qeWqIWxMbOKunVqVOTiHWpsP6fBKV6ZcsNIhgIO5mbVYhEcQh98365SEaLjQtK6tnAV30ExkUw0FBjeouztbiEnnrv6L16YLiw0592k2oX6pKfb1kjSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bN5XIQVxBr9CK3zlwsjwVJJpDqWnZ5+W7R1H4xnaik=;
 b=m4Cb80o+Ej1QaMJAyeW7mm0ynH3QhTn5ZlVhVPHT4dctdMNaEgabeYc8XSDZXtjPvZbrLtLWqaWzipB03666UhJ5yZD6U6Pln3RXWM7+ssZdmRvIXjpSL1pOHiS2b226zHjzRT9DI1wQSm07W7tQTxanw25JFL8bNdDX1GueDng=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5397.eurprd08.prod.outlook.com (2603:10a6:20b:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 10:50:50 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 10:50:49 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Issues with Setscene tasks
Thread-Topic: [meta-virtualization] Issues with Setscene tasks
Thread-Index: AdfEVncNc9xmqwx9RGub9swYejyYXwAAitCAAB+WR8w=
Date: Tue, 19 Oct 2021 10:50:49 +0000
Message-ID: 
 <AM6PR08MB3461304C6D920C9BA19270DC92BD9@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <AM6PR08MB3461855CC2F90763C0EF3CD792BC9@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CADkTA4P4yE8O4yita6H+vd1Xaz8h-iFJaA6MwHFo-1Fr8gQeBQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P4yE8O4yita6H+vd1Xaz8h-iFJaA6MwHFo-1Fr8gQeBQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: f5ca7da1-2fd3-221e-dda7-3eaa548fc875
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 818fe634-adb8-4f5b-e0ce-08d992ee5572
x-ms-traffictypediagnostic: AM7PR08MB5397:|DB8PR08MB4153:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB4153C452044ACE2FA257325792BD9@DB8PR08MB4153.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iiOdjGj5L9PErk2STqxFJU2BwTtcgjGYyGk412duf8N3SgApw/9F/UBi1taELom8fD56c5UdRH9Dffq/MTaQ50f/Y08ewqNc49lQlT4Uv48T5HKfmA6TprTF1GfiKhDEN+sIwTO/rDc/S0IWlVfmmM3jQdufHGL4ucmURTE7zQDL6b0lhHn/xHMJIA0+X8WxLXzWqOSENeBF8jGaUQFI96TfNM5l/TKK1PSBVmBpSXJa7Q75ZsRD1CuT2Vz3pYDYqPrvqXblxKazydybByOiqG8+NRt82ms0oBqvnc9I+XXZtROWf1+MYVnCsHza/EWOEn/RE3cdC4Bxj0k4c07GZvIvH5G/gcTV9I5hmEt4b1KfGobPvSRggqES2fb2fbHGRRZr4hLvZ8FbHSaZSXAFV+FWLrRRGl1k+N/sV+5Cpz8MoC9xQBon7Yl+HU8wwMtW005U84cjdcQkcJOlN9uAji560yYHSzNsY23h0BgMSHQ8+mEbwAgg8ZIxRutfeBuEA3ZqimXqVJcsKqEX9q3J/18vklG8cM+TTG5e6NYaZm/BYP9QVBYOX7a12X3yWzpsvl/S6tGlH8KzmuBpRtnJwStH17MR8Ws42ebQSKP+UK8rA2L52LqFcaEVpuvfp2mmcok5PXkhE9/BPfkM3ZfQP55sBw0Ov6YRlaOWbp/RYgdDOW21Zy+1J15tZlYCycOV+Wv3WuYmm+uiPdQL6f6XUnVj9ac4mETk04HdEB77Tqu3PGsrgTUSzNkMbO7DOdDHzH4DbC5985DOHIO8etxLJEUSWj9mFx/3Tnu2Jx6GIHGdh+Ykmjplg29E5Cw5wv1U
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(86362001)(166002)(6916009)(52536014)(122000001)(26005)(9686003)(66556008)(64756008)(19627405001)(53546011)(55016002)(4326008)(186003)(71200400001)(2906002)(91956017)(7696005)(83380400001)(966005)(66946007)(38070700005)(76116006)(33656002)(5660300002)(66476007)(8936002)(508600001)(6506007)(316002)(8676002)(66446008)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5397
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17cfae6b-d880-43b3-89b9-08d992ee506b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fBsRps+RpMIcGZ93g6QEqv474lbAoKttLu/ZCSZyv97kdl9ywD+Ql3rM1aszT6mvWjfBv3c7QKgnbxIWFbHlPps32TkDzP+qgjUJfev/hEfDe9+Ku0Uq26CQz9UTD/Pao+yu+zU+4dcRx1zl/XwPboFr6eqrnGFuj/+n1n2oaVbEL44QNVimNVj08vbDRmz4JiVs1hu7nQND1u8sDvFwZad2G4Gw9/ggTKqwhyEN9AjpBs/AIFdgJDUTQF3ITqNdggjr4YHzZxCyO/BwNrVNJJ4wvV9tgzo6u46iONWw5oD3spcNPcdx4sT3U8ClQm/8zn7CPe7LaqvtOL8UoTAh9QRR7gqMjpPKl53hGTEa1Aqe9lwTNcD+IGohEWsNT2JskqK2D5YSfbatuMLW03o9TBbeNtq1i3q18vJhZ9OciWRpy2NSm39oFzDgKCdt4LYkwJpssBDl3wjxbSaxr+AFEE6w+8Wr8H9HB/ARenANaOhC02lZP7rdM7ajBweMVkm8WImKcIFPltYOO/10SAlM1770hUbTL/QIrigAU+I8QPCRrkLpJmpziGx5EuiopPalESnBYNSorLFrdgJkypPggoHNM4AcfyaDXoz4xRp6r40Cw1lOZcDcrrJqHN+LHfxX/V4fyvEbPmZ/fbgGbs0DB/uhuaewtH0zX8ltXZU3kWaKAUjiN9C+sV+rCcVQdMG0PlrkedB5FbAbHHQ8TSgm3sKcJXabeIADkPLD/PVn4OESSW0NNCh/AiffZZfrtij7T43F+OSkIirZBAu4EC1hVNsYS+aQsHru/8eDE3aO6nvlulQ7LllQcVcOq57VGxhh
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(19627405001)(82310400003)(8936002)(316002)(36860700001)(356005)(7696005)(4326008)(47076005)(33656002)(83380400001)(30864003)(54906003)(8676002)(166002)(186003)(70586007)(81166007)(2906002)(6862004)(55016002)(9686003)(6506007)(53546011)(508600001)(70206006)(26005)(966005)(336012)(52536014)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 10:50:58.3009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 818fe634-adb8-4f5b-e0ce-08d992ee5572
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4153
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3461304C6D920C9BA19270DC92BD9AM6PR08MB3461eurp_"

--_000_AM6PR08MB3461304C6D920C9BA19270DC92BD9AM6PR08MB3461eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

This is the current fix that I have for docker-moby and cni recipes and I t=
hink it is aligned with the patch that you linked since you are also settin=
g the SRCREV_FORMAT:
```
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-contain=
ers/docker/docker-moby_git.bb
index defb321..f2ccfcd 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -47,6 +47,8 @@ SRC_URI =3D "\
         file://0001-dynbinary-use-go-cross-compiler.patch \
        "

+SRCRV_FORMAT =3D "moby"
+
 require docker.inc

 # Apache-2.0 for docker
diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni=
_git.bb
index cb8d6ff..385d170 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -24,6 +24,8 @@ LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3Dfa8=
18a259cbed7ce8bc2a22d35a464

 GO_IMPORT =3D "import"

+SRCREV_FORMAT =3D "cni"
+
 PV =3D "v0.8.0+git${SRCREV_cni}"

 inherit go
```

________________________________
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Sent: 18 October 2021 20:44
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>; nd <nd@arm.com>
Subject: Re: [meta-virtualization] Issues with Setscene tasks

On Mon, Oct 18, 2021 at 3:30 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> Hi,
>
>
>
> Recently I realized that we are having issues with setscene tasks (for do=
cker-moby and cni recipes) where the packages were rebuild even already hav=
e their tasks in the sstate mirror and bitbake-diffsigs not showing any dif=
ference.
> This is the sample of the output that I was getting:
> ```
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_package_qa_setscene.3335
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_package_qa_setscene) failed with exit code '1' - rea=
l task will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-0/t=
emp/log.do_package_write_rpm_setscene.3336
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_package_write_rpm_setscene) failed with exit code '1=
' - real task will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_populate_lic_setscene.3337
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_populate_lic_setscene) failed with exit code '1' - r=
eal task will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_populate_sysroot_setscene.3338
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_populate_sysroot_setscene) failed with exit code '1'=
 - real task will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_package_qa_setscene.3339
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_packagedata_setscene) failed with exit code '1' - re=
al task will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_package_setscene.3380
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_package_setscene) failed with exit code '1' - real t=
ask will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_deploy_source_date_epoch_setscene.3383
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_deploy_source_date_epoch_setscene) failed with exit =
code '1' - real task will be run instead
>
> ```
>
>
>
> After some debugging I found that the =93failed with exit code 1=94 comes=
 from this line http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/cl=
asses/sstate.bbclass#n764:
> ```
>
> localdata.setVar('SRCPV', d.getVar('SRCPV'))
> ```
>
>
> The root cause is because the cni and docker-moby recipes are using named=
 SRC_URI (a.k.a http://...;name=3Dfoo), setting the PV with it and were not=
 setting the SRCREV_FORMAT which consequentially not set the SRCPV accordin=
gly.
>
>
>
> Setting the SRCREV_FORMAT for cni and docker-moby recipes fixed the issue=
, but I also suspect that the following recipes are potentially having the =
same issue:
>
> ```
> $ grep -r PV | grep SRCREV_
>
> recipes-core/runx/runx_git.bb:PV =3D "v1.0-git${SRCREV_runx}"
>
> recipes-core/runv/runv_git.bb:PV =3D "0.4.0+git${SRCREV_runv}"
>
> recipes-containers/docker/docker-ce_git.bb:PV =3D "${DOCKER_VERSION}+git$=
{SRCREV_docker}"
>
> recipes-containers/docker/docker-moby_git.bb:PV =3D "${DOCKER_VERSION}+gi=
t${SRCREV_moby}"
>
> recipes-containers/cri-o/cri-o_git.bb:PV =3D "1.22.0+git${SRCREV_cri-o}"
>
> recipes-containers/kubernetes/kubernetes_git.bb:PV =3D "v1.22.2+git${SRCR=
EV_kubernetes}"
>
> recipes-containers/cri-tools/cri-tools_git.bb:PV =3D "1.21.0+git${SRCREV_=
cri-tools}"
>
> recipes-containers/crun/crun_git.bb:PV =3D "0.18+git${SRCREV_crun}"
>
> recipes-networking/cni/cni_git.bb:PV =3D "v0.8.0+git${SRCREV_cni}"
>
> recipes-devtools/yq/yq_git.bb:PV =3D "1.13.1+git${SRCREV_yq}"
>
> recipes-devtools/go/go-build_git.bb:PV =3D "0.1-git${SRCREV_runx}"
>
> ```
>
>
>
> I can send a patch to fix cni and docker-moby but unfortunately I don=92t=
 have resources to test the other mentioned recipes.
>

I've actually been going through and fixing these as they pop up, and
just had to do it for kubernetes:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=3D=
master-next&id=3D45e5f2e821784f0b55a41ee5f08d7acb98f8f288

If you were doing anything other than what you see that I did in that
recipe, let me know. Otherwise, I'll make a similar change globally to
the layer.

Bruce

>
>
> --
> Diego Sueiro
> Staff Software Developer =96 Automotive and Industrial Solutions (CE-OSS)
>
>
>
>
>=20
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

--_000_AM6PR08MB3461304C6D920C9BA19270DC92BD9AM6PR08MB3461eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Bruce,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This is the current fix that I have for docker-moby and cni recipes and I t=
hink it is aligned with the patch that you linked since you are also settin=
g the SRCREV_FORMAT:<br>
```<br>
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-contain=
ers/docker/docker-moby_git.bb
<div>index defb321..f2ccfcd 100644</div>
<div>--- a/recipes-containers/docker/docker-moby_git.bb</div>
<div>+++ b/recipes-containers/docker/docker-moby_git.bb</div>
<div>@@ -47,6 +47,8 @@ SRC_URI =3D &quot;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0001-dynbinary-use-go-cross-c=
ompiler.patch \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;</div>
<div>&nbsp;</div>
<div>+SRCRV_FORMAT =3D &quot;moby&quot;</div>
<div>+</div>
<div>&nbsp;require docker.inc</div>
<div>&nbsp;</div>
<div>&nbsp;# Apache-2.0 for docker</div>
<div>diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cn=
i/cni_git.bb</div>
<div>index cb8d6ff..385d170 100644</div>
<div>--- a/recipes-networking/cni/cni_git.bb</div>
<div>+++ b/recipes-networking/cni/cni_git.bb</div>
<div>@@ -24,6 +24,8 @@ LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE=
;md5=3Dfa818a259cbed7ce8bc2a22d35a464</div>
<div>&nbsp;</div>
<div>&nbsp;GO_IMPORT =3D &quot;import&quot;</div>
<div>&nbsp;</div>
<div>+SRCREV_FORMAT =3D &quot;cni&quot;</div>
<div>+</div>
<div>&nbsp;PV =3D &quot;v0.8.0+git${SRCREV_cni}&quot;</div>
<div>&nbsp;</div>
<span>&nbsp;inherit go<br>
</span>```</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Bruce Ashfield &lt;br=
uce.ashfield@gmail.com&gt;<br>
<b>Sent:</b> 18 October 2021 20:44<br>
<b>To:</b> Diego Sueiro &lt;Diego.Sueiro@arm.com&gt;<br>
<b>Cc:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-virtualization] Issues with Setscene tasks</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Mon, Oct 18, 2021 at 3:30 PM Diego Sueiro &lt;d=
iego.sueiro@arm.com&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;</div>
<div class=3D"PlainText">&gt;<br>
&gt;<br>
&gt; Recently I realized that we are having issues with setscene tasks (for=
 docker-moby and cni recipes) where the packages were rebuild even already =
have their tasks in the sstate mirror and bitbake-diffsigs not showing any =
difference.<br>
&gt; This is the sample of the output that I was getting:<br>
&gt; ```<br>
&gt;<br>
&gt; WARNING: Logfile for failed setscene task is /&lt;snip&gt;/build/tmp/w=
ork/neoversen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69=
afc01-r0/temp/log.do_package_qa_setscene.3335<br>
&gt;<br>
&gt; WARNING: Setscene task (/&lt;snip&gt;/layers/meta-virtualization/recip=
es-networking/cni/cni_git.bb:do_package_qa_setscene) failed with exit code =
'1' - real task will be run instead<br>
&gt;<br>
&gt; WARNING: Logfile for failed setscene task is /&lt;snip&gt;/build/tmp/w=
ork/neoversen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69=
afc01-0/temp/log.do_package_write_rpm_setscene.3336<br>
&gt;<br>
&gt; WARNING: Setscene task (/&lt;snip&gt;/layers/meta-virtualization/recip=
es-networking/cni/cni_git.bb:do_package_write_rpm_setscene) failed with exi=
t code '1' - real task will be run instead<br>
&gt;<br>
&gt; WARNING: Logfile for failed setscene task is /&lt;snip&gt;/build/tmp/w=
ork/neoversen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69=
afc01-r0/temp/log.do_populate_lic_setscene.3337<br>
&gt;<br>
&gt; WARNING: Setscene task (/&lt;snip&gt;/layers/meta-virtualization/recip=
es-networking/cni/cni_git.bb:do_populate_lic_setscene) failed with exit cod=
e '1' - real task will be run instead<br>
&gt;<br>
&gt; WARNING: Logfile for failed setscene task is /&lt;snip&gt;/build/tmp/w=
ork/neoversen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69=
afc01-r0/temp/log.do_populate_sysroot_setscene.3338<br>
&gt;<br>
&gt; WARNING: Setscene task (/&lt;snip&gt;/layers/meta-virtualization/recip=
es-networking/cni/cni_git.bb:do_populate_sysroot_setscene) failed with exit=
 code '1' - real task will be run instead<br>
&gt;<br>
&gt; WARNING: Logfile for failed setscene task is /&lt;snip&gt;/build/tmp/w=
ork/neoversen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69=
afc01-r0/temp/log.do_package_qa_setscene.3339<br>
&gt;<br>
&gt; WARNING: Setscene task (/&lt;snip&gt;/layers/meta-virtualization/recip=
es-networking/cni/cni_git.bb:do_packagedata_setscene) failed with exit code=
 '1' - real task will be run instead<br>
&gt;<br>
&gt; WARNING: Logfile for failed setscene task is /&lt;snip&gt;/build/tmp/w=
ork/neoversen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69=
afc01-r0/temp/log.do_package_setscene.3380<br>
&gt;<br>
&gt; WARNING: Setscene task (/&lt;snip&gt;/layers/meta-virtualization/recip=
es-networking/cni/cni_git.bb:do_package_setscene) failed with exit code '1'=
 - real task will be run instead<br>
&gt;<br>
&gt; WARNING: Logfile for failed setscene task is /&lt;snip&gt;/build/tmp/w=
ork/neoversen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69=
afc01-r0/temp/log.do_deploy_source_date_epoch_setscene.3383<br>
&gt;<br>
&gt; WARNING: Setscene task (/&lt;snip&gt;/layers/meta-virtualization/recip=
es-networking/cni/cni_git.bb:do_deploy_source_date_epoch_setscene) failed w=
ith exit code '1' - real task will be run instead<br>
&gt;<br>
&gt; ```<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; After some debugging I found that the =93failed with exit code 1=94 co=
mes from this line
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes=
/sstate.bbclass#n764:">
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/sstate.bbc=
lass#n764:</a><br>
&gt; ```<br>
&gt;<br>
&gt; localdata.setVar('SRCPV', d.getVar('SRCPV'))<br>
&gt; ```<br>
&gt;<br>
&gt;<br>
&gt; The root cause is because the cni and docker-moby recipes are using na=
med SRC_URI (a.k.a
<a href=3D"http://...;name=3Dfoo)">http://...;name=3Dfoo)</a>, setting the =
PV with it and were not setting the SRCREV_FORMAT which consequentially not=
 set the SRCPV accordingly.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Setting the SRCREV_FORMAT for cni and docker-moby recipes fixed the is=
sue, but I also suspect that the following recipes are potentially having t=
he same issue:<br>
&gt;<br>
&gt; ```<br>
&gt; $ grep -r PV | grep SRCREV_<br>
&gt;<br>
&gt; recipes-core/runx/runx_git.bb:PV =3D &quot;v1.0-git${SRCREV_runx}&quot=
;<br>
&gt;<br>
&gt; recipes-core/runv/runv_git.bb:PV =3D &quot;0.4.0+git${SRCREV_runv}&quo=
t;<br>
&gt;<br>
&gt; recipes-containers/docker/docker-ce_git.bb:PV =3D &quot;${DOCKER_VERSI=
ON}+git${SRCREV_docker}&quot;<br>
&gt;<br>
&gt; recipes-containers/docker/docker-moby_git.bb:PV =3D &quot;${DOCKER_VER=
SION}+git${SRCREV_moby}&quot;<br>
&gt;<br>
&gt; recipes-containers/cri-o/cri-o_git.bb:PV =3D &quot;1.22.0+git${SRCREV_=
cri-o}&quot;<br>
&gt;<br>
&gt; recipes-containers/kubernetes/kubernetes_git.bb:PV =3D &quot;v1.22.2+g=
it${SRCREV_kubernetes}&quot;<br>
&gt;<br>
&gt; recipes-containers/cri-tools/cri-tools_git.bb:PV =3D &quot;1.21.0+git$=
{SRCREV_cri-tools}&quot;<br>
&gt;<br>
&gt; recipes-containers/crun/crun_git.bb:PV =3D &quot;0.18+git${SRCREV_crun=
}&quot;<br>
&gt;<br>
&gt; recipes-networking/cni/cni_git.bb:PV =3D &quot;v0.8.0+git${SRCREV_cni}=
&quot;<br>
&gt;<br>
&gt; recipes-devtools/yq/yq_git.bb:PV =3D &quot;1.13.1+git${SRCREV_yq}&quot=
;<br>
&gt;<br>
&gt; recipes-devtools/go/go-build_git.bb:PV =3D &quot;0.1-git${SRCREV_runx}=
&quot;<br>
&gt;<br>
&gt; ```<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; I can send a patch to fix cni and docker-moby but unfortunately I don=
=92t have resources to test the other mentioned recipes.<br>
&gt;<br>
<br>
I've actually been going through and fixing these as they pop up, and<br>
just had to do it for kubernetes:<br>
<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/c=
ommit/?h=3Dmaster-next&amp;id=3D45e5f2e821784f0b55a41ee5f08d7acb98f8f288">h=
ttps://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=3Dm=
aster-next&amp;id=3D45e5f2e821784f0b55a41ee5f08d7acb98f8f288</a><br>
<br>
If you were doing anything other than what you see that I did in that<br>
recipe, let me know. Otherwise, I'll make a similar change globally to<br>
the layer.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Diego Sueiro<br>
&gt; Staff Software Developer =96 Automotive and Industrial Solutions (CE-O=
SS)<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB3461304C6D920C9BA19270DC92BD9AM6PR08MB3461eurp_--
