Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92CCC47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:31:46 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.131])
 by mx.groups.io with SMTP id smtpd.web11.97.1706290303742622698
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 09:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=PAz1oeEg;
 spf=pass (domain: ni.com, ip: 40.107.102.131, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQB+6eGnnTE7ZdwEqNw5w/ZZJtsTQBiKyQwvphB65eZMId9IyuXaO3leabqfQEDd1ij3p0NGfUm9daJjlcnPGvkjWgaQ5FqaXteMbcXLpczfgN8owMI4zOcMlcu1zB+MtO1/nGHB8Tk7T0+b3uNJ2QQBX7wnDcAP00irVr2XYczdaFKdxSIdkcs6FmIa86ug/F3UHRYDQ0d/ER0KqyReHKMFYfNfvhS8e6SMGEfSG5yDk+9MVvNr4nE88ebFcp+QPVl7PZrZAjLbB5yTqMIiyvwbenf7A/4Eztp658ZBibOAsjsF1J8/WncXa1bkWBpZV59ifcw5v7spbARKQVTWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbrpW+ilJr2UHEv4dNLEbO06eCPLkayvaTVm0R9EnOs=;
 b=AenFQiJiSyY9oxiobr12GoFgmCioPR+ag0ZiSvh/byVovuUOmfWDCFjqG7p3j5mFbtusu4oYY8Eb/0t2x7m71ukhWlRJQdGND9DtRbYw2c6umPpRASHrNTCy/bX+aRIzoW+ccLXZpo8v87YdVMjCbsPuNwmJZPqgUqWu5VQZACGdlNpevpUbXj7fvuy5iqTtZxTaEkZ78VXQJsf07K5k0cRx3qt2AzbVMvW/X8RWiEAHsXR7QXw4S1UndSCmEF1cWKv/40u6AHuVJGLBeHMSx6Cb2+6EA2+8oZs4CcsLnUnfEwD8dvbIpZLbkhgv4Ck793MfRoX/wbJu9jIAsldFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbrpW+ilJr2UHEv4dNLEbO06eCPLkayvaTVm0R9EnOs=;
 b=PAz1oeEgj1Yv22Zl9Jo+yW4ddxErG08CdMksrwvV760UXHXed8chiVoOhfxelPYEMCSZKjthzUIQmz6OqjEazvKe7876JFYd3jvGMh3cNnFsoFmvIAjnrwmcWseuwpgw+8hBXVhr5VmAryP9RVhJtH+JPurGbNf5YKw9CJQ/cc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by MW4PR04MB7313.namprd04.prod.outlook.com (2603:10b6:303:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 17:31:41 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 17:31:41 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: meta-virtualization@lists.yoctoproject.org,
	bruce.ashfield@gmail.com
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [meta-virtualization][m-c-s][PATCH 0/3] Upgrade bbappends for nanbield compatibility
Date: Fri, 26 Jan 2024 12:30:47 -0500
Message-ID: <20240126173050.1137474-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BN8PR12CA0020.namprd12.prod.outlook.com
 (2603:10b6:408:60::33) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|MW4PR04MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f86ce64-97d8-4f87-64ba-08dc1e94a847
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fl7vh6oZCq+B380lGDkL9t7P+avbpJjbLl8Ips3yfbOiQabcv11shdk2xLK/OIJ7yT79URdjUXoegdAIY0t7UqCxKKQ8nz4Nqjxtgo0J6P2TuyJqg1emn9wlLvqaa9naqPQzmHO3QKbML33Lh0/duSR+BSizI4SGbwN+1s2Ice2+vvGNG8KdR+mOvGtSDAL+nK73Kv4rec8CrbbJpC6N7LkEMnzXfeIZMT+T2G+0cvOIjvszmqFMnrB8eQq0bzKmo/RxeWHWzcX1k/9eL8DWAIIrSmeiDV1vHgQhjKbSAH0DDq9jZCZ3fj88HmkAye5u1RiLxHi47aCKxSdukp1oNMwS3ERGm3VQs4CoykZiTwMa6jjNs8WFiTesvSXvd3kx8hTkDM1HKw+PXtKijEuDQrp0ijQcfygupPBcaDTTdHhZZfRdjGDHdeGWoKEeYu6rkb8VQ9fpXYaTD9mku5syZYLVEpF/XnGyZvpLqBkvpkHsdb7p3sqhHSVBUUKpRlQ6WcLf4PNgC7ZSeiOVVirRLp7V18pKrgUuOHCqw1fftI6+TyKu3q5hbvACB0r45Jrw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4744005)(2906002)(38100700002)(5660300002)(44832011)(41300700001)(36756003)(6486002)(478600001)(6512007)(6506007)(1076003)(2616005)(83380400001)(8676002)(4326008)(8936002)(66476007)(66946007)(86362001)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l8/Prk6VUIqUBR2UDxn4UeGE2RV5fKr5RGLty0wzrIr5UoFGQfZ+pMnrghTc?=
 =?us-ascii?Q?13J+o/Hpd9tQpvoWUCzTr1WEqCd9yCLj8cNL+fYvQy3/0PYPGso9Wflypu6R?=
 =?us-ascii?Q?qWwy2IhYlUPD6xjy2Q2nfW+UBkFaSl8eZ0v4+Bq7LKLpz7UWxh+tDiZ9cg13?=
 =?us-ascii?Q?obdAHQE09A/rh4gmkVDQsmC0WAcOteJxLp6Jjs/douCyd2F1crovh0pfme1o?=
 =?us-ascii?Q?U12DWTkBsseSGaL9emOvY01i/PXj4+5C3HTpYhwPKlEWdCF1UbiA/HJlpQma?=
 =?us-ascii?Q?i97I8AF1HLcqdbe1tlBcqFHp6iWHyEayAKaHHA55J92DSL3ttEobxocN1Qjd?=
 =?us-ascii?Q?o5DFWjnlXdPypECQuPvv7zS75Np4xIYfXLQfQYhO0RbW6pjfx61OTaUklqbc?=
 =?us-ascii?Q?vEE8xVU9UseU/bhGnOUbiQQtWHUa6xIH3lI+NP+GE5tU+S9P0ufIB/ucxIoe?=
 =?us-ascii?Q?JiZRxnuKNutfDfhq5g8+Pht+26WkIvgyYGtnapAyDoaTqlxf7HcYA2Ufg+hJ?=
 =?us-ascii?Q?Zzpl5sHidGxXX+ACgAHLO2pF45zLViMg0EzonaZ+tPMTUHBxE5CHjY+8cfXw?=
 =?us-ascii?Q?Gs9Wwrd3SK93JfW5aPGksFUEk/7I+pWGQQk1kRe7sa4Clge29vaKDNc3A2HC?=
 =?us-ascii?Q?QV3c7F+ug/Hvgkg6+9Lmp97exuRWDopl5hqn6rFX+kkATLovOV6CC4wqYKSc?=
 =?us-ascii?Q?fbQpu3EkeIJuciXsGq9taVinrNOvN7PLjzPnIf7aWrtrXZvqong23iyXZZkT?=
 =?us-ascii?Q?ZlnD6Mm1DYqMhSKMSaD4WLB+uBH+EskOfq8hbgYxmHcSx6R2eHC3x5I8J4+6?=
 =?us-ascii?Q?aUL5pCuYAdJ/DB+VcoYQwooU2um/GYOauQyS+UGlQ6JIzN3vP7BZmj9YM1sM?=
 =?us-ascii?Q?GEDij/e67ME1zazcwo38wXAI4993Sn6DSMJ7kFpdL5FRMSzoJSTdQV2+xErg?=
 =?us-ascii?Q?eAgdvHaeyREzUyziYDFb0OGGnRPXyic+Xt0Tsngj95fgL7NsIQ5zDolfaYEp?=
 =?us-ascii?Q?UY9hhjMuqspREr65xv8t5aq4qjPG6CkO4WjEn0AcFmerUELCokDgkTjLDemA?=
 =?us-ascii?Q?H6U80nDhe6gPa3+1ql/yYHP2yeMVA1PyKqGiIYr/q8d6Ihqhq7y14D69K/Nr?=
 =?us-ascii?Q?bZ8XKT2DXuLGQHvzIIltTa/xJ7b6GVcWwG35UKVYc4cBrDnZxj1S18eGUrOW?=
 =?us-ascii?Q?s67szpZYZ0HDYzeMZcc10u3T73Ka/3oZw4btWKu0XtE7W+wso0pKB15QXBv4?=
 =?us-ascii?Q?o5kJ7IALjNNZDaaSKZmzkX70Wx9vTbhBzfz+zVxucCbN+olLB91k/xogckau?=
 =?us-ascii?Q?wupgiiqJTLpqwi+uEO0LuC+DhmmPJ7DrcFXWiXkfDHm31npfeRxfDF5Xhgub?=
 =?us-ascii?Q?bHV23ZOP/9vZ1rVi89XzH3RHO6TdUlb19Jzks/JWLsRoViDAE4mEYgGIJg0I?=
 =?us-ascii?Q?QmdtnA/6bxkB8ODyhIYIoHIQpiiv4hQcDjc79QRYdTFXww/8kkmH1HcUtSrI?=
 =?us-ascii?Q?rvWKMziCjvRTDW6kcWcL9UFOJoqojXIrPvCutVMHmtsbg6RhR3WG390Ls1wt?=
 =?us-ascii?Q?hjd5xDXJD9DJyjEYv95eox4cPqCHVtnsOeqBiJTFZidmCGRs5ZKtBnfkjjI3?=
 =?us-ascii?Q?/YMl8qD5qAK3w5wC94ZJpI0=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f86ce64-97d8-4f87-64ba-08dc1e94a847
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 17:31:40.8253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dz9kNl4JaSEsR8B1ly21kKUkx/b9V0yEP158Yq0hfTNJxrLJ/OMmPYyGbDNmI4dO+mUY8i8ydebmxhmTzijKHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7313
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jan 2024 17:31:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8552

This patchset upgrades the bbappends of some recipes whose base versions
have advanced in the main layers' nanbield releases.

Alex Stewart (3):
  qemu: upgrade bbappend to 8.%
  libvirt: upgrade bbappend to 9.%
  iproute2: upgrade bbappend to 6.%

 .../qemu/{qemu_7.%.bbappend =3D> qemu_8.%.bbappend}                 | 0
 .../libvirt/{libvirt_8.%.bbappend =3D> libvirt_9.%.bbappend}        | 0
 .../iproute2/{iproute2_5.%.bbappend =3D> iproute2_6.%.bbappend}     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-devtools/qemu/{qemu_7.%.bbappend =3D> qemu_8=
.%.bbappend} (100%)
 rename meta-openstack/recipes-extended/libvirt/{libvirt_8.%.bbappend =3D> =
libvirt_9.%.bbappend} (100%)
 rename meta-openstack/recipes-support/iproute2/{iproute2_5.%.bbappend =3D>=
 iproute2_6.%.bbappend} (100%)

--=20
2.40.1


