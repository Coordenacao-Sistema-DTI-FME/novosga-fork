(function () {
    'use strict';

    console.log('painel-voz.js carregado');

    let vozes = [];

    function carregarVozes() {
        vozes = window.speechSynthesis.getVoices();

        console.log(
            '[painel-voz] Vozes disponíveis:',
            vozes.map(v => `${v.name} (${v.lang})`)
        );
    }

    carregarVozes();

        if (typeof window.speechSynthesis !== 'undefined' && window.speechSynthesis.onvoiceschanged !== undefined) {
            window.speechSynthesis.onvoiceschanged = carregarVozes;
        }

        window.PainelVoz = {

            falarChamada(chamada) {
            if (!chamada || !chamada.senha) {
                return;
            }

            if (!vozes || vozes.length === 0) {
                vozes = window.speechSynthesis.getVoices();
            }

            const senha = chamada.senha || '';
            const local = chamada.local || '';
            const numeroLocal = chamada.numeroLocal || '';

            const texto = `Senha ${senha}, dirigir-se ao ${local} ${numeroLocal}`;

            console.log('[painel-voz] Falando:', {
                senha,
                local,
                numeroLocal,
            });

            // Procura especificamente o Rudolph
            let vozSelecionada = vozes.find(
                voz => voz.name.toLowerCase().includes('rudolph')
            );

            // Se não encontrar, tenta Maria
            if (!vozSelecionada) {
                vozSelecionada = vozes.find(
                    voz => voz.name.toLowerCase().includes('maria')
                );
            }

            // Se ainda não encontrar, tenta Daniel
            if (!vozSelecionada) {
                vozSelecionada = vozes.find(
                    voz => voz.name.toLowerCase().includes('daniel')
                );
            }

            console.log(
                '[painel-voz] Voz escolhida:',
                vozSelecionada
                    ? `${vozSelecionada.name} (${vozSelecionada.lang})`
                    : 'PADRÃO DO SISTEMA'
            );

            const utterance = new SpeechSynthesisUtterance(texto);

            utterance.lang = 'pt-BR';
            utterance.rate = 0.72;
            utterance.pitch = 1;
            utterance.volume = 1;

            if (vozSelecionada) {
                utterance.voice = vozSelecionada;
            }

            // Pequeno atraso para evitar conflito com cancelamento/falas anteriores
            window.speechSynthesis.cancel();

            setTimeout(() => {
                window.speechSynthesis.speak(utterance);
            }, 100);
        },
    };
})();