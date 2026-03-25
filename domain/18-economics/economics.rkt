#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; DOMAIN: Economics
;;; LAYER: 18-economics
;;; DEPENDS ON: 12-information (information asymmetry, signaling),
;;;   16-mathematics (optimization, game theory foundations)
;;; DEPENDED ON BY: policy analysis, financial engineering,
;;;   organizational theory, mechanism design
;;;
;;; PURPOSE: The study of how agents allocate scarce resources
;;; under conditions of scarcity, uncertainty, and strategic
;;; interaction — from individual choice to aggregate outcomes.
;;;
;;; SCOPE: Only accepted, verified facts. No novel claims.
;;; Novel claims belong in research/, built on top of this domain.
;;;
;;; SOURCES:
;;; [Mankiw-2021] N.G. Mankiw, "Principles of Economics",
;;;   9th ed., Cengage Learning, 2021.
;;; [Varian-2014] H.R. Varian, "Intermediate Microeconomics:
;;;   A Modern Approach", 9th ed., W.W. Norton, 2014.
;;; [Kahneman-2011] D. Kahneman, "Thinking, Fast and Slow",
;;;   Farrar, Straus and Giroux, 2011.
;;; [Kahneman-Tversky-1979] D. Kahneman & A. Tversky, "Prospect
;;;   Theory: An Analysis of Decision under Risk", Econometrica,
;;;   47(2):263-291, 1979. DOI: 10.2307/1914185
;;; [Nash-1950] J.F. Nash, "Equilibrium Points in N-Person Games",
;;;   Proc. Natl. Acad. Sci. 36(1):48-49, 1950.
;;; [Black-Scholes-1973] F. Black & M. Scholes, "The Pricing of
;;;   Options and Corporate Liabilities", J. Political Economy,
;;;   81(3):637-654, 1973. DOI: 10.1086/260062
;;; [Ricardo-1817] D. Ricardo, "On the Principles of Political
;;;   Economy and Taxation", 1817.
;;; [Nakamoto-2008] S. Nakamoto, "Bitcoin: A Peer-to-Peer
;;;   Electronic Cash System", 2008.
;;; [Samuelson-1954] P.A. Samuelson, "The Pure Theory of Public
;;;   Expenditure", Rev. Econ. Stat. 36(4):387-389, 1954.
;;;
;;; CALIBRATION: economics.cal.rkt (not yet written)
;;; ═══════════════════════════════════════════════════════════════

(domain-economics

  ((economics (allocation-of-scarce-resources) (authoritative)
    ((allocation-of-scarce-resources . authoritative))))

  (

    ;;; ═══════════════════════════════════════════════════════════
    ;;; SUPPLY AND DEMAND — the foundational market mechanism
    ;;; SOURCE: [Mankiw-2021] Ch.4; [Varian-2014] Ch.1
    ;;; ═══════════════════════════════════════════════════════════

    (demand
      (quantity-buyers-willing-to-purchase-at-each-price)
      (law-of-demand-inverse-price-quantity-relationship)
      ((quantity-buyers-willing-to-purchase-at-each-price . ceteris-paribus)
       (ceteris-paribus . higher-price-lower-quantity-demanded)
       (higher-price-lower-quantity-demanded . downward-sloping-demand-curve)
       (downward-sloping-demand-curve . shifts-from-income-preferences-substitutes-complements)
       (shifts-from-income-preferences-substitutes-complements . movement-along-curve-from-price-change)
       (movement-along-curve-from-price-change . law-of-demand-inverse-price-quantity-relationship)))

    (supply
      (quantity-sellers-willing-to-produce-at-each-price)
      (law-of-supply-direct-price-quantity-relationship)
      ((quantity-sellers-willing-to-produce-at-each-price . ceteris-paribus)
       (ceteris-paribus . higher-price-higher-quantity-supplied)
       (higher-price-higher-quantity-supplied . upward-sloping-supply-curve)
       (upward-sloping-supply-curve . shifts-from-input-costs-technology-expectations)
       (shifts-from-input-costs-technology-expectations . movement-along-curve-from-price-change)
       (movement-along-curve-from-price-change . law-of-supply-direct-price-quantity-relationship)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PRICE EQUILIBRIUM — where supply meets demand
    ;;; SOURCE: [Mankiw-2021] Ch.4 pp.77-80; [Varian-2014] Ch.1
    ;;; ═══════════════════════════════════════════════════════════

    (price-equilibrium
      (price-where-quantity-supplied-equals-quantity-demanded)
      (market-clearing-price)
      ((price-where-quantity-supplied-equals-quantity-demanded . no-excess-supply-no-excess-demand)
       (no-excess-supply-no-excess-demand . above-equilibrium-surplus-drives-price-down)
       (above-equilibrium-surplus-drives-price-down . below-equilibrium-shortage-drives-price-up)
       (below-equilibrium-shortage-drives-price-up . self-correcting-mechanism)
       (self-correcting-mechanism . Walrasian-tatonnement)
       (Walrasian-tatonnement . market-clearing-price)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; ELASTICITY — responsiveness of quantity to price
    ;;; SOURCE: [Mankiw-2021] Ch.5; [Varian-2014] Ch.15
    ;;; ═══════════════════════════════════════════════════════════

    (price-elasticity-of-demand
      (percent-change-in-quantity-demanded-over-percent-change-in-price)
      (measures-demand-responsiveness-to-price)
      ((percent-change-in-quantity-demanded-over-percent-change-in-price . typically-negative-by-law-of-demand)
       (typically-negative-by-law-of-demand . elastic-if-absolute-value-greater-than-1)
       (elastic-if-absolute-value-greater-than-1 . inelastic-if-absolute-value-less-than-1)
       (inelastic-if-absolute-value-less-than-1 . unit-elastic-if-absolute-value-equals-1)
       (unit-elastic-if-absolute-value-equals-1 . determinants-substitutes-necessity-time-horizon)
       (determinants-substitutes-necessity-time-horizon . measures-demand-responsiveness-to-price)))

    (income-elasticity-of-demand
      (percent-change-in-quantity-demanded-over-percent-change-in-income)
      (classifies-normal-vs-inferior-goods)
      ((percent-change-in-quantity-demanded-over-percent-change-in-income . positive-for-normal-goods)
       (positive-for-normal-goods . negative-for-inferior-goods)
       (negative-for-inferior-goods . greater-than-1-for-luxury-goods)
       (greater-than-1-for-luxury-goods . less-than-1-for-necessities)
       (less-than-1-for-necessities . classifies-normal-vs-inferior-goods)))

    (cross-price-elasticity
      (percent-change-in-Qd-of-good-A-over-percent-change-in-price-of-good-B)
      (identifies-substitutes-and-complements)
      ((percent-change-in-Qd-of-good-A-over-percent-change-in-price-of-good-B . positive-for-substitutes)
       (positive-for-substitutes . negative-for-complements)
       (negative-for-complements . zero-for-unrelated-goods)
       (zero-for-unrelated-goods . identifies-substitutes-and-complements)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MARGINAL UTILITY — the basis of consumer choice
    ;;; SOURCE: [Varian-2014] Ch.4; [Mankiw-2021] Ch.21
    ;;; ═══════════════════════════════════════════════════════════

    (marginal-utility
      (additional-satisfaction-from-one-more-unit)
      (diminishing-marginal-utility)
      ((additional-satisfaction-from-one-more-unit . utility-function-U-of-x)
       (utility-function-U-of-x . MU-equals-dU-over-dx)
       (MU-equals-dU-over-dx . diminishing-each-additional-unit-yields-less-satisfaction)
       (diminishing-each-additional-unit-yields-less-satisfaction . consumer-optimum-MU-per-dollar-equal-across-goods)
       (consumer-optimum-MU-per-dollar-equal-across-goods . MUx-over-Px-equals-MUy-over-Py)
       (MUx-over-Px-equals-MUy-over-Py . diminishing-marginal-utility)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GDP — gross domestic product
    ;;; SOURCE: [Mankiw-2021] Ch.23-24
    ;;; ═══════════════════════════════════════════════════════════

    (gross-domestic-product
      (total-market-value-of-final-goods-and-services-in-a-country-in-a-period)
      (Y-equals-C-plus-I-plus-G-plus-NX)
      ((total-market-value-of-final-goods-and-services-in-a-country-in-a-period . expenditure-approach)
       (expenditure-approach . C-consumption-by-households)
       (C-consumption-by-households . I-investment-by-firms)
       (I-investment-by-firms . G-government-purchases)
       (G-government-purchases . NX-net-exports-equals-exports-minus-imports)
       (NX-net-exports-equals-exports-minus-imports . nominal-GDP-in-current-prices)
       (nominal-GDP-in-current-prices . real-GDP-in-constant-base-year-prices)
       (real-GDP-in-constant-base-year-prices . GDP-deflator-equals-nominal-over-real-times-100)
       (GDP-deflator-equals-nominal-over-real-times-100 . Y-equals-C-plus-I-plus-G-plus-NX)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; INFLATION — sustained increase in the general price level
    ;;; SOURCE: [Mankiw-2021] Ch.24, Ch.30
    ;;; ═══════════════════════════════════════════════════════════

    (inflation
      (sustained-increase-in-general-price-level)
      (measured-by-CPI-or-GDP-deflator)
      ((sustained-increase-in-general-price-level . erodes-purchasing-power-of-money)
       (erodes-purchasing-power-of-money . CPI-consumer-price-index-basket-of-goods)
       (CPI-consumer-price-index-basket-of-goods . demand-pull-too-much-money-chasing-too-few-goods)
       (demand-pull-too-much-money-chasing-too-few-goods . cost-push-rising-input-costs)
       (cost-push-rising-input-costs . quantity-theory-MV-equals-PY)
       (quantity-theory-MV-equals-PY . Fisher-equation-nominal-i-equals-real-r-plus-inflation-pi)
       (Fisher-equation-nominal-i-equals-real-r-plus-inflation-pi . measured-by-CPI-or-GDP-deflator)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; INTEREST RATES — the price of borrowing money
    ;;; SOURCE: [Mankiw-2021] Ch.26, Ch.34
    ;;; ═══════════════════════════════════════════════════════════

    (interest-rates
      (price-of-borrowing-money-percent-per-period)
      (determined-by-loanable-funds-market-and-central-bank)
      ((price-of-borrowing-money-percent-per-period . nominal-rate-observed-in-market)
       (nominal-rate-observed-in-market . real-rate-equals-nominal-minus-expected-inflation)
       (real-rate-equals-nominal-minus-expected-inflation . supply-of-loanable-funds-from-saving)
       (supply-of-loanable-funds-from-saving . demand-for-loanable-funds-from-investment)
       (demand-for-loanable-funds-from-investment . equilibrium-rate-clears-loanable-funds-market)
       (equilibrium-rate-clears-loanable-funds-market . term-structure-yield-curve)
       (term-structure-yield-curve . determined-by-loanable-funds-market-and-central-bank)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MONETARY POLICY — central bank control of money supply
    ;;; SOURCE: [Mankiw-2021] Ch.29-30, Ch.34
    ;;; ═══════════════════════════════════════════════════════════

    (monetary-policy
      (central-bank-actions-to-influence-money-supply-and-interest-rates)
      (tools-open-market-ops-reserve-requirements-discount-rate)
      ((central-bank-actions-to-influence-money-supply-and-interest-rates . Federal-Reserve-in-US)
       (Federal-Reserve-in-US . dual-mandate-maximum-employment-and-stable-prices)
       (dual-mandate-maximum-employment-and-stable-prices . open-market-operations-buy-sell-government-bonds)
       (open-market-operations-buy-sell-government-bonds . reserve-requirement-ratio)
       (reserve-requirement-ratio . discount-rate-lending-to-banks)
       (discount-rate-lending-to-banks . tools-open-market-ops-reserve-requirements-discount-rate)))

    (federal-funds-rate
      (overnight-interbank-lending-rate)
      (primary-instrument-of-Fed-monetary-policy)
      ((overnight-interbank-lending-rate . rate-banks-charge-each-other-for-overnight-reserves)
       (rate-banks-charge-each-other-for-overnight-reserves . FOMC-sets-target-range)
       (FOMC-sets-target-range . lowered-to-stimulate-economy)
       (lowered-to-stimulate-economy . raised-to-cool-inflation)
       (raised-to-cool-inflation . transmitted-to-other-rates-via-yield-curve)
       (transmitted-to-other-rates-via-yield-curve . primary-instrument-of-Fed-monetary-policy)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; FISCAL POLICY — government spending and taxation
    ;;; SOURCE: [Mankiw-2021] Ch.26, Ch.34
    ;;; ═══════════════════════════════════════════════════════════

    (fiscal-policy
      (government-spending-and-taxation-to-influence-economy)
      (expansionary-or-contractionary)
      ((government-spending-and-taxation-to-influence-economy . expansionary-increase-G-or-decrease-T)
       (expansionary-increase-G-or-decrease-T . contractionary-decrease-G-or-increase-T)
       (contractionary-decrease-G-or-increase-T . multiplier-effect-spending-creates-income-creates-spending)
       (multiplier-effect-spending-creates-income-creates-spending . crowding-out-government-borrowing-raises-interest-rates)
       (crowding-out-government-borrowing-raises-interest-rates . automatic-stabilizers-taxes-and-transfers-adjust-with-cycle)
       (automatic-stabilizers-taxes-and-transfers-adjust-with-cycle . budget-deficit-when-G-exceeds-T)
       (budget-deficit-when-G-exceeds-T . expansionary-or-contractionary)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; MARKET STRUCTURES — from perfect competition to monopoly
    ;;; SOURCE: [Mankiw-2021] Ch.14-17; [Varian-2014] Ch.22-27
    ;;; ═══════════════════════════════════════════════════════════

    (perfect-competition
      (many-buyers-many-sellers-homogeneous-product)
      (price-takers-P-equals-MC-in-long-run)
      ((many-buyers-many-sellers-homogeneous-product . free-entry-and-exit)
       (free-entry-and-exit . perfect-information)
       (perfect-information . each-firm-is-price-taker)
       (each-firm-is-price-taker . profit-max-at-P-equals-MC)
       (profit-max-at-P-equals-MC . zero-economic-profit-in-long-run)
       (zero-economic-profit-in-long-run . allocatively-and-productively-efficient)
       (allocatively-and-productively-efficient . price-takers-P-equals-MC-in-long-run)))

    (monopoly
      (single-seller-no-close-substitutes-barriers-to-entry)
      (price-maker-P-greater-than-MC-deadweight-loss)
      ((single-seller-no-close-substitutes-barriers-to-entry . barriers-legal-natural-strategic)
       (barriers-legal-natural-strategic . faces-entire-market-demand-curve)
       (faces-entire-market-demand-curve . MR-less-than-P-because-must-lower-price-for-all-units)
       (MR-less-than-P-because-must-lower-price-for-all-units . profit-max-at-MR-equals-MC)
       (profit-max-at-MR-equals-MC . charges-P-greater-than-MC)
       (charges-P-greater-than-MC . creates-deadweight-loss)
       (creates-deadweight-loss . price-maker-P-greater-than-MC-deadweight-loss)))

    (oligopoly
      (few-sellers-interdependent-decisions)
      (strategic-interaction-game-theory-applies)
      ((few-sellers-interdependent-decisions . significant-barriers-to-entry)
       (significant-barriers-to-entry . each-firm-considers-rivals-reactions)
       (each-firm-considers-rivals-reactions . Cournot-model-quantity-competition)
       (Cournot-model-quantity-competition . Bertrand-model-price-competition)
       (Bertrand-model-price-competition . collusion-incentive-to-form-cartel)
       (collusion-incentive-to-form-cartel . cartel-instability-incentive-to-cheat)
       (cartel-instability-incentive-to-cheat . strategic-interaction-game-theory-applies)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; GAME THEORY — strategic interaction among rational agents
    ;;; SOURCE: [Nash-1950]; [Varian-2014] Ch.28-29; [Mankiw-2021] Ch.17
    ;;; ═══════════════════════════════════════════════════════════

    (Nash-equilibrium
      (strategy-profile-where-no-player-can-unilaterally-improve)
      (each-strategy-is-best-response-to-others)
      ((strategy-profile-where-no-player-can-unilaterally-improve . given-others-strategies-fixed)
       (given-others-strategies-fixed . no-profitable-deviation-exists)
       (no-profitable-deviation-exists . may-not-be-unique)
       (may-not-be-unique . may-not-be-Pareto-optimal)
       (may-not-be-Pareto-optimal . Nash-1950-existence-theorem-finite-games)
       (Nash-1950-existence-theorem-finite-games . each-strategy-is-best-response-to-others)))

    (prisoners-dilemma
      (two-players-each-can-cooperate-or-defect)
      (dominant-strategy-defect-despite-mutual-cooperation-being-better)
      ((two-players-each-can-cooperate-or-defect . payoff-matrix-temptation-reward-punishment-sucker)
       (payoff-matrix-temptation-reward-punishment-sucker . T-greater-than-R-greater-than-P-greater-than-S)
       (T-greater-than-R-greater-than-P-greater-than-S . defect-dominates-regardless-of-other-action)
       (defect-dominates-regardless-of-other-action . Nash-equilibrium-is-mutual-defection)
       (Nash-equilibrium-is-mutual-defection . mutual-cooperation-Pareto-dominates-but-unstable)
       (mutual-cooperation-Pareto-dominates-but-unstable . dominant-strategy-defect-despite-mutual-cooperation-being-better)))

    (dominant-strategy
      (strategy-yielding-highest-payoff-regardless-of-opponents-actions)
      (strictly-or-weakly-dominant)
      ((strategy-yielding-highest-payoff-regardless-of-opponents-actions . strictly-dominant-always-strictly-better)
       (strictly-dominant-always-strictly-better . weakly-dominant-never-worse-sometimes-better)
       (weakly-dominant-never-worse-sometimes-better . dominated-strategy-is-never-best-response)
       (dominated-strategy-is-never-best-response . iterated-elimination-of-dominated-strategies)
       (iterated-elimination-of-dominated-strategies . strictly-or-weakly-dominant)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BEHAVIORAL ECONOMICS — systematic departures from
    ;;; rational choice
    ;;; SOURCE: [Kahneman-Tversky-1979]; [Kahneman-2011]
    ;;; ═══════════════════════════════════════════════════════════

    (prospect-theory
      (decision-under-risk-with-reference-dependent-preferences)
      (value-function-S-shaped-probability-weighting)
      ((decision-under-risk-with-reference-dependent-preferences . Kahneman-Tversky-1979)
       (Kahneman-Tversky-1979 . outcomes-evaluated-relative-to-reference-point)
       (outcomes-evaluated-relative-to-reference-point . value-function-concave-for-gains-convex-for-losses)
       (value-function-concave-for-gains-convex-for-losses . steeper-for-losses-than-gains)
       (steeper-for-losses-than-gains . probability-weighting-overweight-small-underweight-large)
       (probability-weighting-overweight-small-underweight-large . value-function-S-shaped-probability-weighting)))

    (loss-aversion
      (losses-loom-larger-than-equivalent-gains)
      (loss-aversion-coefficient-approximately-2-to-2.5)
      ((losses-loom-larger-than-equivalent-gains . Kahneman-Tversky-1979-empirical-finding)
       (Kahneman-Tversky-1979-empirical-finding . losing-100-dollars-hurts-more-than-gaining-100-dollars-pleases)
       (losing-100-dollars-hurts-more-than-gaining-100-dollars-pleases . explains-endowment-effect)
       (explains-endowment-effect . explains-status-quo-bias)
       (explains-status-quo-bias . loss-aversion-ratio-lambda-approximately-2-to-2.5)
       (loss-aversion-ratio-lambda-approximately-2-to-2.5 . loss-aversion-coefficient-approximately-2-to-2.5)))

    (anchoring
      (initial-information-biases-subsequent-judgments)
      (adjustment-from-anchor-typically-insufficient)
      ((initial-information-biases-subsequent-judgments . Tversky-Kahneman-1974-heuristic)
       (Tversky-Kahneman-1974-heuristic . arbitrary-anchor-influences-estimate)
       (arbitrary-anchor-influences-estimate . even-random-numbers-affect-judgment)
       (even-random-numbers-affect-judgment . adjustment-from-anchor-is-typically-insufficient)
       (adjustment-from-anchor-is-typically-insufficient . affects-negotiations-pricing-forecasting)
       (affects-negotiations-pricing-forecasting . adjustment-from-anchor-typically-insufficient)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; STOCK MARKETS — organized exchanges for equity securities
    ;;; SOURCE: [Mankiw-2021] Ch.27; [Varian-2014] Ch.11
    ;;; ═══════════════════════════════════════════════════════════

    (bid-ask-spread
      (difference-between-highest-buy-and-lowest-sell-price)
      (compensation-to-market-maker-for-providing-liquidity)
      ((difference-between-highest-buy-and-lowest-sell-price . bid-price-highest-buyers-will-pay)
       (bid-price-highest-buyers-will-pay . ask-price-lowest-sellers-will-accept)
       (ask-price-lowest-sellers-will-accept . spread-equals-ask-minus-bid)
       (spread-equals-ask-minus-bid . narrower-spread-indicates-more-liquid-market)
       (narrower-spread-indicates-more-liquid-market . compensation-to-market-maker-for-providing-liquidity)))

    (market-capitalization
      (total-market-value-of-outstanding-shares)
      (share-price-times-shares-outstanding)
      ((total-market-value-of-outstanding-shares . share-price-times-shares-outstanding)
       (share-price-times-shares-outstanding . large-cap-mid-cap-small-cap-classification)
       (large-cap-mid-cap-small-cap-classification . used-for-index-weighting)
       (used-for-index-weighting . does-not-equal-enterprise-value)
       (does-not-equal-enterprise-value . enterprise-value-adds-debt-subtracts-cash)))

    (price-to-earnings-ratio
      (share-price-divided-by-earnings-per-share)
      (valuation-metric-comparing-price-to-profitability)
      ((share-price-divided-by-earnings-per-share . trailing-PE-uses-past-12-months-earnings)
       (trailing-PE-uses-past-12-months-earnings . forward-PE-uses-estimated-future-earnings)
       (forward-PE-uses-estimated-future-earnings . higher-PE-suggests-growth-expectations-or-overvaluation)
       (higher-PE-suggests-growth-expectations-or-overvaluation . lower-PE-suggests-value-or-low-growth-expectations)
       (lower-PE-suggests-value-or-low-growth-expectations . varies-by-industry-and-market-conditions)
       (varies-by-industry-and-market-conditions . valuation-metric-comparing-price-to-profitability)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; CRYPTOCURRENCY — decentralized digital currencies
    ;;; SOURCE: [Nakamoto-2008]
    ;;; ═══════════════════════════════════════════════════════════

    (blockchain
      (distributed-append-only-ledger-of-transactions)
      (chain-of-cryptographically-linked-blocks)
      ((distributed-append-only-ledger-of-transactions . each-block-contains-hash-of-previous-block)
       (each-block-contains-hash-of-previous-block . tamper-evident-changing-block-invalidates-chain)
       (tamper-evident-changing-block-invalidates-chain . replicated-across-network-nodes)
       (replicated-across-network-nodes . consensus-mechanism-determines-valid-chain)
       (consensus-mechanism-determines-valid-chain . eliminates-need-for-trusted-third-party)
       (eliminates-need-for-trusted-third-party . chain-of-cryptographically-linked-blocks)))

    (proof-of-work
      (consensus-by-computational-puzzle-solving)
      (miners-expend-energy-to-validate-blocks)
      ((consensus-by-computational-puzzle-solving . Nakamoto-2008-Bitcoin)
       (Nakamoto-2008-Bitcoin . find-nonce-such-that-hash-below-target)
       (find-nonce-such-that-hash-below-target . difficulty-adjusts-to-maintain-block-interval)
       (difficulty-adjusts-to-maintain-block-interval . longest-chain-rule-most-cumulative-work)
       (longest-chain-rule-most-cumulative-work . energy-intensive-by-design)
       (energy-intensive-by-design . miners-expend-energy-to-validate-blocks)))

    (proof-of-stake
      (consensus-by-staking-cryptocurrency-as-collateral)
      (validators-selected-proportional-to-stake)
      ((consensus-by-staking-cryptocurrency-as-collateral . validators-lock-up-tokens)
       (validators-lock-up-tokens . selected-to-propose-blocks-proportional-to-stake)
       (selected-to-propose-blocks-proportional-to-stake . slashing-penalty-for-malicious-behavior)
       (slashing-penalty-for-malicious-behavior . energy-efficient-compared-to-proof-of-work)
       (energy-efficient-compared-to-proof-of-work . Ethereum-transitioned-PoW-to-PoS-2022)
       (Ethereum-transitioned-PoW-to-PoS-2022 . validators-selected-proportional-to-stake)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; DERIVATIVES — contracts whose value derives from an
    ;;; underlying asset
    ;;; SOURCE: [Black-Scholes-1973]; [Mankiw-2021] Ch.27
    ;;; ═══════════════════════════════════════════════════════════

    (options
      (contract-granting-right-not-obligation-to-buy-or-sell)
      (call-option-right-to-buy-put-option-right-to-sell)
      ((contract-granting-right-not-obligation-to-buy-or-sell . at-specified-strike-price)
       (at-specified-strike-price . before-or-at-expiration-date)
       (before-or-at-expiration-date . call-option-right-to-buy-underlying)
       (call-option-right-to-buy-underlying . put-option-right-to-sell-underlying)
       (put-option-right-to-sell-underlying . American-exercisable-anytime-before-expiry)
       (American-exercisable-anytime-before-expiry . European-exercisable-only-at-expiry)
       (European-exercisable-only-at-expiry . call-option-right-to-buy-put-option-right-to-sell)))

    (futures
      (standardized-contract-to-buy-or-sell-at-future-date-and-price)
      (obligation-for-both-parties-traded-on-exchange)
      ((standardized-contract-to-buy-or-sell-at-future-date-and-price . traded-on-organized-exchanges)
       (traded-on-organized-exchanges . marked-to-market-daily)
       (marked-to-market-daily . margin-requirement-as-collateral)
       (margin-requirement-as-collateral . used-for-hedging-and-speculation)
       (used-for-hedging-and-speculation . underlying-can-be-commodities-currencies-indices)
       (underlying-can-be-commodities-currencies-indices . obligation-for-both-parties-traded-on-exchange)))

    (Black-Scholes-model
      (option-pricing-formula-for-European-options)
      (C-equals-S-N-d1-minus-K-e-neg-rT-N-d2)
      ((option-pricing-formula-for-European-options . Black-Scholes-1973)
       (Black-Scholes-1973 . assumes-geometric-Brownian-motion-of-stock-price)
       (assumes-geometric-Brownian-motion-of-stock-price . assumes-constant-volatility-and-risk-free-rate)
       (assumes-constant-volatility-and-risk-free-rate . no-arbitrage-pricing-principle)
       (no-arbitrage-pricing-principle . inputs-S-K-T-r-sigma)
       (inputs-S-K-T-r-sigma . S-stock-price-K-strike-T-time-r-rate-sigma-volatility)
       (S-stock-price-K-strike-T-time-r-rate-sigma-volatility . Greeks-delta-gamma-theta-vega-rho)
       (Greeks-delta-gamma-theta-vega-rho . C-equals-S-N-d1-minus-K-e-neg-rT-N-d2)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; BANKING — fractional reserve system
    ;;; SOURCE: [Mankiw-2021] Ch.29
    ;;; ═══════════════════════════════════════════════════════════

    (fractional-reserve-banking
      (banks-hold-fraction-of-deposits-as-reserves-lend-the-rest)
      (creates-money-through-lending)
      ((banks-hold-fraction-of-deposits-as-reserves-lend-the-rest . reserve-ratio-R-fraction-held)
       (reserve-ratio-R-fraction-held . excess-reserves-lent-to-borrowers)
       (excess-reserves-lent-to-borrowers . borrower-deposits-create-new-lending-capacity)
       (borrower-deposits-create-new-lending-capacity . process-repeats-through-banking-system)
       (process-repeats-through-banking-system . bank-run-risk-if-depositors-withdraw-simultaneously)
       (bank-run-risk-if-depositors-withdraw-simultaneously . FDIC-insurance-mitigates-bank-run-risk)
       (FDIC-insurance-mitigates-bank-run-risk . creates-money-through-lending)))

    (money-multiplier
      (maximum-money-creation-from-initial-deposit)
      (multiplier-equals-1-over-reserve-ratio)
      ((maximum-money-creation-from-initial-deposit . simple-multiplier-1-over-R)
       (simple-multiplier-1-over-R . if-R-is-10-percent-multiplier-is-10)
       (if-R-is-10-percent-multiplier-is-10 . 100-dollar-deposit-can-create-up-to-1000-dollars)
       (100-dollar-deposit-can-create-up-to-1000-dollars . actual-multiplier-lower-due-to-cash-drain-and-excess-reserves)
       (actual-multiplier-lower-due-to-cash-drain-and-excess-reserves . M-equals-m-times-monetary-base)
       (M-equals-m-times-monetary-base . multiplier-equals-1-over-reserve-ratio)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; COMPARATIVE ADVANTAGE — basis of trade
    ;;; SOURCE: [Ricardo-1817]; [Mankiw-2021] Ch.3, Ch.9
    ;;; ═══════════════════════════════════════════════════════════

    (comparative-advantage
      (ability-to-produce-at-lower-opportunity-cost-than-trading-partner)
      (Ricardo-1817-basis-for-mutually-beneficial-trade)
      ((ability-to-produce-at-lower-opportunity-cost-than-trading-partner . differs-from-absolute-advantage)
       (differs-from-absolute-advantage . absolute-advantage-is-lower-input-cost-per-unit)
       (absolute-advantage-is-lower-input-cost-per-unit . comparative-advantage-is-lower-opportunity-cost)
       (comparative-advantage-is-lower-opportunity-cost . even-if-one-country-has-absolute-advantage-in-everything)
       (even-if-one-country-has-absolute-advantage-in-everything . both-countries-gain-from-specialization-and-trade)
       (both-countries-gain-from-specialization-and-trade . Ricardo-England-Portugal-cloth-wine-example)
       (Ricardo-England-Portugal-cloth-wine-example . Ricardo-1817-basis-for-mutually-beneficial-trade)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; EXTERNALITIES — costs or benefits not reflected in price
    ;;; SOURCE: [Mankiw-2021] Ch.10; [Varian-2014] Ch.34
    ;;; ═══════════════════════════════════════════════════════════

    (externalities
      (cost-or-benefit-imposed-on-third-parties-not-in-transaction)
      (causes-market-failure-quantity-diverges-from-social-optimum)
      ((cost-or-benefit-imposed-on-third-parties-not-in-transaction . negative-externality-cost-on-third-parties)
       (negative-externality-cost-on-third-parties . pollution-is-classic-negative-externality)
       (pollution-is-classic-negative-externality . positive-externality-benefit-to-third-parties)
       (positive-externality-benefit-to-third-parties . education-is-classic-positive-externality)
       (education-is-classic-positive-externality . Pigouvian-tax-internalizes-negative-externality)
       (Pigouvian-tax-internalizes-negative-externality . Coase-theorem-private-bargaining-if-property-rights-clear-and-transaction-costs-low)
       (Coase-theorem-private-bargaining-if-property-rights-clear-and-transaction-costs-low . causes-market-failure-quantity-diverges-from-social-optimum)))

    ;;; ═══════════════════════════════════════════════════════════
    ;;; PUBLIC GOODS — non-rivalrous and non-excludable
    ;;; SOURCE: [Samuelson-1954]; [Mankiw-2021] Ch.11
    ;;; ═══════════════════════════════════════════════════════════

    (public-goods
      (non-rivalrous-and-non-excludable)
      (free-rider-problem-leads-to-underprovision-by-market)
      ((non-rivalrous-and-non-excludable . non-rivalrous-one-persons-use-does-not-reduce-availability)
       (non-rivalrous-one-persons-use-does-not-reduce-availability . non-excludable-cannot-prevent-people-from-using)
       (non-excludable-cannot-prevent-people-from-using . national-defense-is-classic-example)
       (national-defense-is-classic-example . free-rider-problem-incentive-to-not-pay)
       (free-rider-problem-incentive-to-not-pay . market-underprovides-relative-to-social-optimum)
       (market-underprovides-relative-to-social-optimum . government-provision-or-subsidy-as-solution)
       (government-provision-or-subsidy-as-solution . Samuelson-1954-optimal-provision-condition)
       (Samuelson-1954-optimal-provision-condition . free-rider-problem-leads-to-underprovision-by-market)))

  )

  ((economics . economics-registered)))
